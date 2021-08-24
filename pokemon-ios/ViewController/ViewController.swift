//
//  ViewController.swift
//  pokemon-ios
//
//  Created by Rahmad Hidayat on 21/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    private let listPokemonVM = ListPokemonViewModel()
    private var listPokemonData = [NamePokemonModel]() {
        didSet {
            self.tableview.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.loadData()
    }

    private func loadData() {
        self.listPokemonVM.getListDataPokemon(
            onSuccess: { result in
                print("xxx results \(result.results[0])")
                self.listPokemonData = result.results
                print("xxx result \(self.listPokemonData[0])")
            },
            onError: { error in
                print("xxx error \(error)")
            },
            onFailed: { failed in
                print("xxx failed \(failed)")
            })
    }
    
    private func setupCell(){
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        let nibPokemon = UINib(nibName: "ListPokemonTableViewCell", bundle: nil)
        self.tableview.register(nibPokemon, forCellReuseIdentifier: "ListPokemonTableViewCell")
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listPokemonData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListPokemonTableViewCell") as! ListPokemonTableViewCell
        let target = self.listPokemonData[indexPath.row]
        cell.setupCell(pokemonName: target.name)
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let target = self.listPokemonData[indexPath.row]
        let detailPokemonVC = StoryboardScene.DetailPokemon.DetailPokemonViewController.instantiate()
        detailPokemonVC.name = target.name
        detailPokemonVC.url = target.url
        self.navigationController?.pushViewController(detailPokemonVC, animated: false)
    }
}
