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

        // MARK: Dogs list view model
        container.register(DogsListViewModel.self) { resolver in
            guard let fetchAllBreeds = resolver.resolve(FetchAllBreeds.self) else {
                fatalError("FetchAllBreeds dependency could not be resolved")
            }
            return DogsListViewModel(fetchAllBreeds: fetchAllBreeds)
        }
    }
}
