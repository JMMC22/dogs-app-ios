//
//  ViewModelsAssembly.swift
//  DogsApp
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Domain
import Features
import Swinject

final class ViewModelsAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: Breeds list view model
        container.register(BreedsListViewModel.self) { resolver in
            guard let fetchAllBreeds = resolver.resolve(FetchAllBreeds.self) else {
                fatalError("FetchAllBreeds dependency could not be resolved")
            }
            return BreedsListViewModel(fetchAllBreeds: fetchAllBreeds)
        }
    
        // MARK: Breed details view model
        container.register(BreedDetailsViewModel.self) { resolver in
            return BreedDetailsViewModel()
        }
    }
}
