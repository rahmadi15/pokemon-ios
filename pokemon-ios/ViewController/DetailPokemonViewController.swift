//
//  DetailPokemonViewController.swift
//  pokemon-ios
//
//  Created by Rahmad Hidayat on 23/08/21.
//

import UIKit
import Kingfisher

class DetailPokemonViewController: UIViewController {

    @IBOutlet weak var ivPokemon: UIImageView!
    @IBOutlet weak var lbInfinity1: UILabel!
    @IBOutlet weak var lbInfinity2: UILabel!
    @IBOutlet weak var lbInfinity3: UILabel!
    @IBOutlet weak var lbInfinity4: UILabel!
    @IBOutlet weak var lbInfinity5: UILabel!
    @IBOutlet weak var lbInfinity6: UILabel!
    @IBOutlet weak var lbNamePokemon: UILabel!
    @IBOutlet weak var lbTypes: UILabel!
    @IBOutlet weak var pvHp: UIProgressView!
    @IBOutlet weak var pvAtk: UIProgressView!
    @IBOutlet weak var pvDef: UIProgressView!
    @IBOutlet weak var pvSatk: UIProgressView!
    @IBOutlet weak var pvSdef: UIProgressView!
    @IBOutlet weak var pvSpd: UIProgressView!
    @IBOutlet weak var lbValueTorrent: UILabel!
    @IBOutlet weak var lbValueDish: UILabel!
    @IBOutlet weak var ivSpritesNormal: UIImageView!
    @IBOutlet weak var ivSpritesShiny: UIImageView!
    
    
    let detailPokemonVM = DetailPokemonViewModel()
    var url = ""
    var name = ""
    var type = ""
    var abilityTorent = ""
    var abilityRainDish = ""
    var photoSpritesNormal = ""
    var photoSpritesShiny = ""
    var hpValue = 0
    var atkValue = 0
    var defValue = 0
    var satkValue = 0
    var sdefValue = 0
    var spdValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.loadData(url: self.url)
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func setupView() {
        self.lbNamePokemon.text = self.name
        self.lbTypes.text = self.type
        self.lbValueTorrent.text = self.abilityTorent
        self.lbValueDish.text = self.abilityRainDish
        self.pvHp.progress = Float(Float(hpValue )/100.0)
        self.lbInfinity1.text = "\(hpValue)"
        self.pvAtk.progress = Float(Float(atkValue )/100.0)
        self.lbInfinity2.text = "\(atkValue)"
        self.pvDef.progress = Float(Float(defValue )/100.0)
        self.lbInfinity3.text = "\(defValue)"
        self.pvSatk.progress = Float(Float(satkValue )/100.0)
        self.lbInfinity4.text = "\(satkValue)"
        self.pvSdef.progress = Float(Float(sdefValue )/100.0)
        self.lbInfinity5.text = "\(sdefValue)"
        self.pvSpd.progress = Float(Float(spdValue )/100.0)
        self.lbInfinity6.text = "\(spdValue)"
        
        if let urlPhotoNormal = URL(string: self.photoSpritesNormal) {
            self.ivSpritesNormal.kf.setImage(with: urlPhotoNormal)
            self.ivPokemon.kf.setImage(with: urlPhotoNormal)
        }
        
        if let urlPhotoShiny = URL(string: self.photoSpritesShiny) {
            self.ivSpritesShiny.kf.setImage(with: urlPhotoShiny)
        }
    }
    
    private func loadData(url: String) {
        self.detailPokemonVM.getDetailDataPokemon(
            url: url,
            onSuccess: { result in
                self.type = result.types[0].type.name
                self.abilityTorent = result.abilities[0].ability.name
                self.abilityRainDish = result.abilities[1].ability.name
                self.hpValue = result.stats[0].baseStats
                self.atkValue = result.stats[1].baseStats
                self.defValue = result.stats[2].baseStats
                self.satkValue = result.stats[3].baseStats
                self.sdefValue = result.stats[4].baseStats
                self.spdValue = result.stats[5].baseStats
                self.photoSpritesNormal = result.sprites.frontDefault
                self.photoSpritesShiny = result.sprites.frontShiny
                self.setupView()
            },
            onError: { _ in
            },
            onFailed: { _ in
            })
    }

}
