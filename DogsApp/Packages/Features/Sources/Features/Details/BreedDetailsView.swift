//
//  SwiftUIView.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import SwiftUI

public struct BreedDetailsView: View {

    @StateObject private var viewModel: BreedDetailsViewModel

    public init(viewModel: BreedDetailsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        Text("BreedDetailsView")
    }
}
