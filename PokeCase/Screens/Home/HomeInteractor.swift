//
//  HomeInteractor.swift
//  PokeCase
//
//  Created by CAN TUNTAS on 6.12.2022.
//

import Foundation

final class HomeInteractor: HomeInteractorProtocol {
    
    weak var delegate: HomeInteractorDelegate?
    private let network: NetworkService
    private var pokemons: [PokemonDetail] = []
    private var displayablePokemons: [PokemonViewModel] = []
    
    init(network: NetworkService) {
        self.network = network
    }
    
    func load() {
        let request = PokemonRequest()
        
        network.perform(request) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error.rawValue)
            case .success(let response):
                self?.loadDetail(response.results)
            }
        }
    }
    
    func loadDetail(_ pokeNames: [Pokemon]) {
        let group = DispatchGroup()
        pokeNames.forEach { pokemon in
            group.enter()
            let request = PokemonDetailRequest(name: pokemon.name)
            network.perform(request) { [weak self] result in
                switch result {
                case .failure(let error):
                    print(error.rawValue)
                case .success(let response):
                    self?.pokemons.append(response)
                    print(response.sprites.frontDefault)
                }
                group.leave()
            }
        }
        group.notify(queue: .main) {
            self.mapToViewModel()
        }
    }
    
    func mapToViewModel() {
        let viewModels = pokemons.map({ PokemonViewModel(
            name: $0.name,
            imageURL: (URL(string: $0.sprites.frontDefault) ?? URL(string: "any-url.com"))!,
            abilities: $0.abilities.map { $0.ability.name }
        )})
        displayablePokemons = viewModels
        delegate?.handleOutput(.displayItems(viewModels))
        delegate?.handleOutput(.isLoading(false))
    }
        
    func selectItem(at index: Int) {
        let selectedPokemon = displayablePokemons[index]
        delegate?.handleOutput(.displayDetailItem(selectedPokemon))
    }
    
}

struct PokemonViewModel {
    let name: String
    let imageURL: URL
    let abilities: [String]
}
