//
//  ViewModelsAssembly.swift
//  DogsApp
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Features
import Swinject

final class ViewModelsAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: Dogs list view model
        container.register(DogsListViewModel.self) { _ in
            return DogsListViewModel()
        }
    }
}
