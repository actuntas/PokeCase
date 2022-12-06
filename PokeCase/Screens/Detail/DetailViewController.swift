//
//  DetailViewController.swift
//  PokeCase
//
//  Created by CAN TUNTAS on 6.12.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var abilitiesLabel: UILabel!
    @IBOutlet weak var abilitiesStackView: UIStackView!
    var presenter: DetailPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
    }
    
}

extension DetailViewController: DetailViewProtocol {
    func update(with pokemon: PokemonViewModel) {
        self.title = pokemon.name
        headerImageView.sd_setImage(with: pokemon.imageURL)
        pokemon.abilities.forEach({ abilitiesLabel.text?.append(contentsOf: " \($0)") })
    }
}
