//
//  ListPokemonViewModel.swift
//  pokemon-ios
//
//  Created by Rahmad Hidayat on 22/08/21.
//

import Foundation

class ListPokemonViewModel {
    
    public func getListDataPokemon(onSuccess: @escaping(ListPokemonModel) -> Void, onError: @escaping(String) -> Void, onFailed: @escaping(String) -> Void) {
        ApiService().getListPokemon(
            onSuccess: { response in onSuccess(response) },
            onError: { error in onError(error) },
            onFailed: { failed in onFailed(failed) })
    }
}
