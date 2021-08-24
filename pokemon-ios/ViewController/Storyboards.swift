//
//  Storyboards.swift
//  pokemon-ios
//
//  Created by Rahmad Hidayat on 23/08/21.
//

import Foundation
import UIKit

internal enum StoryboardScene {
    internal enum DetailPokemon: StoryboardType {
        internal static let storyboardName = "DetailPokemon"
        
        internal static let DetailPokemonViewController = SceneType<DetailPokemonViewController>(storyboard: DetailPokemon.self, identifier: "DetailPokemonViewController")
    }
}

// MARK: - Implementation Details

internal protocol StoryboardType {
    static var storyboardName: String { get }
}

internal extension StoryboardType {
    static var storyboard: UIStoryboard {
        let name = self.storyboardName
        return UIStoryboard(name: name, bundle: Bundle(for: BundleToken.self))
    }
}

internal struct SceneType<T: UIViewController> {
    internal let storyboard: StoryboardType.Type
    internal let identifier: String
    
    internal func instantiate() -> T {
        let identifier = self.identifier
        guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
        }
        return controller
    }
}

internal struct InitialSceneType<T: UIViewController> {
    internal let storyboard: StoryboardType.Type
    
    internal func instantiate() -> T {
        guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
            fatalError("ViewController is not of the expected class \(T.self).")
        }
        return controller
    }
}

private final class BundleToken {}
