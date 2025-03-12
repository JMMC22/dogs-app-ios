//
//  SwiftUIView.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import SwiftUI

public struct BreedsListView: View {

    @StateObject private var viewModel: BreedsListViewModel

    // MARK: - Navigation

    @EnvironmentObject var router: NavigationRouter

    public init(viewModel: BreedsListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    // MARK: - Visual constants

    private enum VisualConstants {
        static let containerPadding: EdgeInsets = EdgeInsets(top: 12, leading: 16, bottom: 24, trailing: 16)
        static let listSpacing: CGFloat = 12
    }

    // MARK: - Body
    public var body: some View {
        ScrollView {
            LazyVStack(spacing: VisualConstants.listSpacing) {
                ForEach(viewModel.breeds, id: \.name) { breed in
                    BreedsListRowView(name: breed.name) {
                        router.event = .presentDetails(breed: breed.name)
                    }
                }
            }
            .padding(VisualConstants.containerPadding)
        }
        .searchable(text: $viewModel.searchText)
        .onAppear {
            viewModel.viewOnAppear()
        }
    }
}
