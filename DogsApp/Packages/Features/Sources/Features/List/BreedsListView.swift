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

    // MARK: - Body
    public var body: some View {
        ScrollView {
            if viewModel.isLoading {
                ProgressView()
            } else {
                BreedsListContainerView(viewModel: viewModel) { event in
                    router.event = event
                }
            }
        }
        .searchable(text: $viewModel.searchText)
        .errorAlert(isPresented: .constant(viewModel.error != nil),
                    message: viewModel.error?.localizedDescription ?? "Error")
        .onAppear {
            viewModel.viewOnAppear()
        }
    }
}

struct BreedsListContainerView: View {

    @ObservedObject private var viewModel: BreedsListViewModel

    // MARK: - Navigation

    private let navigateTo: (AppNavigationEvent) -> Void

    init(viewModel: BreedsListViewModel, 
         navigateTo: @escaping (AppNavigationEvent) -> Void) {
        self.viewModel = viewModel
        self.navigateTo = navigateTo
    }
    
    // MARK: - Visual constants

    private enum VisualConstants {
        static let containerPadding: EdgeInsets = EdgeInsets(top: 12, leading: 16, bottom: 24, trailing: 16)
        static let listSpacing: CGFloat = 12
    }

    var body: some View {
        LazyVStack(spacing: VisualConstants.listSpacing) {
            ForEach(viewModel.breeds, id: \.name) { breed in
                BreedsListRowView(name: breed.name) {
                    navigateTo(.presentDetails(breed: breed.name))
                }
            }
        }
        .padding(VisualConstants.containerPadding)
    }
}
