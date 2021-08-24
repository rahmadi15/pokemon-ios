//
//  ListPokemonTableViewCell.swift
//  pokemon-ios
//
//  Created by Rahmad Hidayat on 22/08/21.
//

import UIKit

class ListPokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var lbNamePokemon: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setupCell(pokemonName: String) {
        print("xxx okeokoe")
        self.lbNamePokemon.text = pokemonName
    }
}
