//
//  ListPokemonModel.swift
//  pokemon-ios
//
//  Created by Rahmad Hidayat on 22/08/21.
//

import Foundation

struct ListPokemonModel: Codable {
    let count : Int
    let next : String
    let results: [NamePokemonModel]
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case results = "results"
    }
}


struct NamePokemonModel : Codable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}
