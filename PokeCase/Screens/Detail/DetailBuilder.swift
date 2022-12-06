//
//  DetailBuilder.swift
//  PokeCase
//
//  Created by CAN TUNTAS on 6.12.2022.
//

import UIKit

final class DetailBuilder {
    static func make(with pokemon: PokemonViewModel) -> DetailViewController {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let presenter = DetailPresenter(view: view, pokemon: pokemon)
        view.presenter = presenter
        
        return view
    }
}
