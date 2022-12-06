//
//  DetailContractor.swift
//  PokeCase
//
//  Created by CAN TUNTAS on 6.12.2022.
//

import UIKit

protocol DetailPresenterProtocol {
    func load()
}

protocol DetailViewProtocol: AnyObject {
    func update(with pokemon: PokemonViewModel)
}
