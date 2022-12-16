//
//  HomeProtocols.swift
//  PokeCase
//
//  Created by CAN TUNTAS on 6.12.2022.
//

import Foundation

protocol HomeInteractorProtocol: AnyObject {
    var delegate: HomeInteractorDelegate? { get set }
    func load()
    func selectItem(at index: Int)
}

enum HomeInteractorOutput {
    case isLoading(Bool)
    case displayItems([PokemonDetail])
    case displayDetailItem(PokemonDetail)
}

protocol HomeInteractorDelegate: AnyObject {
    func handleOutput(_ output: HomeInteractorOutput)
}

protocol HomePresenterProtocol: AnyObject {
    func load()
    func selectItem(at index: Int)
}

enum HomePresenterOutput {
    case updateTite(String)
    case isLoading(Bool)
    case displayItems([PokemonViewModel])
}

protocol HomeViewProtocol: AnyObject {
    func handleOutput(_ output: HomePresenterOutput)
}

enum HomeRoute {
    case detail(PokemonViewModel)
}

protocol HomeRouterProtocol: AnyObject {
    func navigate(to route: HomeRoute)
}
