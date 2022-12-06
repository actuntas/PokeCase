//
//  PokemonRequest.swift
//  PokeCase
//
//  Created by CAN TUNTAS on 6.12.2022.
//

import Foundation

struct PokemonRequest: Requestable {
    typealias Response = PokemonResponse
    
    var path: String {
        return "/api/v2/pokemon"
    }

    var httpMethod: RequestMethod {
        .GET
    }
    var headers: [String : String] {
        APIConstants.headers
    }
}

struct PokemonDetailRequest: Requestable {
    typealias Response = PokemonDetail
    
    var name: String
    var path: String {
        return "/api/v2/pokemon/\(name)"
    }
    var httpMethod: RequestMethod {
        .GET
    }
    var headers: [String : String] {
        APIConstants.headers
    }
}
