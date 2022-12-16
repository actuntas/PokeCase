//
//  HomePresenter.swift
//  PokeCase
//
//  Created by CAN TUNTAS on 6.12.2022.
//

import Foundation

final class HomePresenter: HomePresenterProtocol {
    
    private weak var view: HomeViewProtocol?
    private let interactor: HomeInteractorProtocol
    private let router: HomeRouterProtocol
    
    init(view: HomeViewProtocol, interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        interactor.delegate = self
    }
    
    func load() {
        view?.handleOutput(.updateTite("Poké"))
        interactor.load()
    }
    
    func selectItem(at index: Int) {
        interactor.selectItem(at: index)
    }
    
    private func mapToViewModel(rawPokemons: [PokemonDetail]) -> [PokemonViewModel] {
        return rawPokemons.map({ PokemonViewModel(
            name: $0.name,
            imageURL: (URL(string: $0.sprites.frontDefault) ?? URL(string: "any-url.com"))!,
            abilities: $0.abilities.map { $0.ability.name }
        )
        })
    }
    
}

extension HomePresenter: HomeInteractorDelegate {
    func handleOutput(_ output: HomeInteractorOutput) {
        DispatchQueue.main.async {
            switch output {
            case .isLoading(let isLoading):
                self.view?.handleOutput(.isLoading(isLoading))
            case .displayItems(let pokemons):
                let displayablePokemons = self.mapToViewModel(rawPokemons: pokemons)
                self.view?.handleOutput(.displayItems(displayablePokemons))
            case .displayDetailItem(let pokemon):
                let displayablePokemon = PokemonViewModel(
                    name: pokemon.name,
                    imageURL: (URL(string: pokemon.sprites.frontDefault) ?? URL(string: "any-url.com"))!,
                    abilities: pokemon.abilities.map { $0.ability.name }
                )
                self.router.navigate(to: .detail(displayablePokemon))
            }
        }
    }
}

struct PokemonViewModel {
    let name: String
    let imageURL: URL
    let abilities: [String]
}
