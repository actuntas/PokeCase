//
//  HomeBuilder.swift
//  PokeCase
//
//  Created by CAN TUNTAS on 6.12.2022.
//

import UIKit

final class HomeBuilder {
    
    static func make() -> UIViewController {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let router = HomeRouter(view: view)
        let network = DefaultNetworkService()
        let interactor = HomeInteractor(network: network)
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        
        return view
    }
}
