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

        // MARK: Dogs list view
        container.register(DogsListView.self) { resolver in
            guard let viewModel = resolver.resolve(DogsListViewModel.self) else {
                fatalError("DogsListViewModel dependency could not be resolved")
            }
            return DogsListView(viewModel: viewModel)
        }
    }
}
