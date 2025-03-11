//
//  AppCoordinatorView.swift
//  DogsApp
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import SwiftUI

struct AppCoordinatorView: View {

    @StateObject private var coordinator = AppCoordinator()
    let rootPage: AppCoordinator.Page

    @State private var sheetHeight: CGFloat = 0

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
    }
}
