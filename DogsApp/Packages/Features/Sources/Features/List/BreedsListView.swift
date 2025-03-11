//
//  SwiftUIView.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import SwiftUI

public struct BreedsListView: View {

    @StateObject private var viewModel: BreedsListViewModel

    // MARK: Navigation
    @EnvironmentObject var router: NavigationRouter

    public init(viewModel: BreedsListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        List {
            ForEach(viewModel.breeds, id: \.name) { breed in
                Button(breed.name) {
                    router.event = .presentDetails(breed: breed.name)
                }
            }
        }
        .searchable(text: $viewModel.searchText)
        .onAppear {
            viewModel.viewOnAppear()
        }
    }
}
