//
//  DetailPokemonModel.swift
//  pokemon-ios
//
//  Created by Rahmad Hidayat on 24/08/21.
//

import Foundation

class DetailPokemonViewModel {
    public func getDetailDataPokemon(url: String, onSuccess: @escaping(DetailPokemonModel) -> Void, onError: @escaping(String) -> Void, onFailed: @escaping(String) -> Void) {
        ApiService().getDetailPokemon(
            url: url,
            onSuccess: { response in onSuccess(response) },
            onError: { error in onError(error) },
            onFailed: { failed in onFailed(failed) })
    }
}
