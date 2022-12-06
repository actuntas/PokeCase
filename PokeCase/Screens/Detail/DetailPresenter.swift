//
//  DetailPresenter.swift
//  PokeCase
//
//  Created by CAN TUNTAS on 6.12.2022.
//

import Foundation

final class DetailPresenter: DetailPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    private let pokemon: PokemonViewModel
    
    init(view: DetailViewProtocol, pokemon: PokemonViewModel) {
        self.view = view
        self.pokemon = pokemon
    }
    
    func load() {
        view?.update(with: pokemon)
    }
    
}

