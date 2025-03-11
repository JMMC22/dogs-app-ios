//
//  ContentView.swift
//  DogsApp
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        AppCoordinatorView(rootPage: .list)
    }
}

#Preview {
    ContentView()
}
