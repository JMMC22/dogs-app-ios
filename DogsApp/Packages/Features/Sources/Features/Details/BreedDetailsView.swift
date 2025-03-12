//
//  SwiftUIView.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import SwiftUI
import UI

public struct BreedDetailsView: View {

    @StateObject private var viewModel: BreedDetailsViewModel

    public init(viewModel: BreedDetailsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    // MARK: - Visual constants

    private enum VisualConstants {
        static let containerPadding: EdgeInsets = EdgeInsets(top: 12, leading: 16, bottom: 24, trailing: 16)
        static let spacing: CGFloat = 12
    }

    // MARK: - Body

    public var body: some View {
        VStack(alignment: .leading, spacing: VisualConstants.spacing) {
            image()
            Divider()
            title()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(VisualConstants.containerPadding)
        .onAppear {
            viewModel.viewDidAppear()
        }
    }

    // MARK: - Container Views

    private func image() -> some View {
        BreedDetailsImageView(imageURL: viewModel.imageURL)
    }

    private func title() -> some View {
        Text(viewModel.breed.capitalized)
            .dogFont(.Roboto(24, weight: .black), color: .black)
    }
}
