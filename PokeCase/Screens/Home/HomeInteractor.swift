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
    
    private func loadDetail(_ pokeNames: [Pokemon]) {
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
            self.delegate?.handleOutput(.displayItems(self.pokemons))
            self.delegate?.handleOutput(.isLoading(false))
        }
    }
        
    func selectItem(at index: Int) {
        let selectedPokemon = pokemons[index]
        delegate?.handleOutput(.displayDetailItem(selectedPokemon))
    }
    
}
