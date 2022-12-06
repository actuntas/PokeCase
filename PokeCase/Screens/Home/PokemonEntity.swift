//
//  PokemonEntity.swift
//  PokeCase
//
//  Created by CAN TUNTAS on 6.12.2022.
//

import Foundation

struct PokemonResponse: Decodable {
    var results: [Pokemon]
}

struct Pokemon: Decodable {
    let name: String
    let url: String
}

struct Ability: Decodable {
    let ability: Species
}

struct Sprites: Decodable {
    let frontDefault: String
}

struct PokemonDetail: Decodable {
    let name: String
    let abilities: [Ability]
    let sprites: Sprites
}

struct Species: Decodable {
    let name: String
}



