//
//  AppCoordinator.swift
//  DogsApp
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import SwiftUI
import Features

class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var presentedItem: AppCoordinator.Page?
}

extension AppCoordinator {
    enum Page: Hashable, Identifiable {
        case list
        case details(breed: String)

        var id: String {
            String(describing: self)
        }
    }

    // MARK: - Navigate
    func push(_ page: AppCoordinator.Page) {
        path.append(page)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    // MARK: - Sheet
    func present(_ page: AppCoordinator.Page) {
        presentedItem = page
    }

    func dismissSheet() {
        self.presentedItem = nil
    }

    @ViewBuilder
    func build(page: AppCoordinator.Page) -> some View {
        switch page {
        case .list:
            DIContainer.shared.container.resolve(BreedsListView.self)
        case .details(let breed):
            DIContainer.shared.container.resolve(BreedDetailsView.self, argument: breed)
        }
    }
}
