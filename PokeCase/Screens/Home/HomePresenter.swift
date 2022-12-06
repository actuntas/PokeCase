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
    
}

extension HomePresenter: HomeInteractorDelegate {
    func handleOutput(_ output: HomeInteractorOutput) {
        switch output {
        case .isLoading(let isLoading):
            DispatchQueue.main.async {
                self.view?.handleOutput(.isLoading(isLoading))
            }
        case .displayItems(let pokemons):
            DispatchQueue.main.async {
                self.view?.handleOutput(.displayItems(pokemons))
            }
        case .displayDetailItem(let pokemon):
            DispatchQueue.main.async {
                self.router.navigate(to: .detail(pokemon))
            }
        }
    }
}
