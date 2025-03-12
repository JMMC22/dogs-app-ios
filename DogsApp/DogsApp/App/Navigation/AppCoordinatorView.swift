//
//  AppCoordinatorView.swift
//  DogsApp
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import SwiftUI
import Features

struct AppCoordinatorView: View {

    @StateObject private var coordinator = AppCoordinator()
    @StateObject private var router = NavigationRouter()
    let rootPage: AppCoordinator.Page

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: rootPage)
                .navigationDestination(for: AppCoordinator.Page.self) { page in
                    coordinator.build(page: page)
                }
                .sheet(item: $coordinator.presentedItem) { sheet in
                    coordinator.build(page: sheet)
                }
        }
        .environmentObject(coordinator)
        .environmentObject(router)
        .onReceive(router.$event) { event in
            if let event = event {
                handleNavigation(event)
            }
        }
    }

    private func handleNavigation(_ event: AppNavigationEvent) {
        switch event {
        case .presentDetails(let breed):
            coordinator.present(.details(breed: breed))
        }
    }
}
