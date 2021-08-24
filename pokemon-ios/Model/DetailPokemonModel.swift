//
//  DetailPokemonModel.swift
//  pokemon-ios
//
//  Created by Rahmad Hidayat on 24/08/21.
//

import Foundation

struct DetailPokemonModel: Codable {

    let stats: [StatsModel]
    let abilities: [AbilitiesModel]
    let types: [TypesModel]
    let sprites : SpritesModel
    
    enum CodingKeys: String, CodingKey {
        case stats = "stats"
        case abilities = "abilities"
        case types = "types"
        case sprites = "sprites"
    }
}

struct StatsModel: Codable {
    let baseStats : Int
    let effort: Int
    let stat: DetailStatsModel
    
    enum CodingKeys: String, CodingKey {
        case baseStats = "base_stat"
        case effort = "effort"
        case stat = "stat"
    }
}

struct DetailStatsModel: Codable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}

struct AbilitiesModel: Codable {
    let ability: AbilityModel
    let isHiden: Bool
    let slot: Int
    
    enum CodingKeys: String, CodingKey {
        case ability = "ability"
        case isHiden = "is_hidden"
        case slot = "slot"
    }
}

struct AbilityModel: Codable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}

struct TypesModel: Codable {
    let slot: Int
    let type: TypeModel
    
    
    enum CodingKeys: String, CodingKey {
        case slot = "slot"
        case type = "type"
    }
}


struct TypeModel: Codable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

struct SpritesModel: Codable {
    let frontDefault: String
    let frontShiny: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}
