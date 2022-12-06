//
//  HomeRouter.swift
//  PokeCase
//
//  Created by CAN TUNTAS on 6.12.2022.
//

import UIKit

final class HomeRouter: HomeRouterProtocol {
    
    weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: HomeRoute) {
        switch route {
        case .detail(let pokemon):
            let detailView = DetailBuilder.make(with: pokemon)
            view?.show(detailView, sender: nil)
        }
    }
    
}
