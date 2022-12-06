//
//  HomeCell.swift
//  PokeCase
//
//  Created by CAN TUNTAS on 6.12.2022.
//

import UIKit
import SDWebImage

class HomeCell: UITableViewCell {
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
    }

    func populate(with pokemon: PokemonViewModel) {
        pokemonNameLabel.text = pokemon.name
        pokemonImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        pokemonImageView.sd_setImage(with: pokemon.imageURL)
    }
    
    override func prepareForReuse() {
        self.pokemonNameLabel.text = ""
        pokemonImageView.image = nil
        pokemonImageView.sd_cancelCurrentImageLoad()
    }
    
}


