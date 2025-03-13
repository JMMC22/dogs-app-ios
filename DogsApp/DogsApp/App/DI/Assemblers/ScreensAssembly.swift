//
//  ScreensAssembly.swift
//  DogsApp
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Features
import Swinject

final class ScreensAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: Breeds list view
        container.register(BreedsListView.self) { resolver in
            guard let viewModel = resolver.resolve(BreedsListViewModel.self) else {
                fatalError("BreedsListViewModel dependency could not be resolved")
            }
            return BreedsListView(viewModel: viewModel)
        }

        // MARK: Breed details view
        container.register(BreedDetailsView.self) { (resolver, breed: String) in
            guard let viewModel = resolver.resolve(BreedDetailsViewModel.self, argument: breed) else {
                fatalError("BreedDetailsView dependency could not be resolved")
            }
            return BreedDetailsView(viewModel: viewModel)
        }
    }
}
