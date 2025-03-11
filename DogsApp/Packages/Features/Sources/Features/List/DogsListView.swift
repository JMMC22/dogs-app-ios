//
//  SwiftUIView.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import SwiftUI

public struct DogsListView: View {

    @StateObject private var viewModel: DogsListViewModel

    public init(viewModel: DogsListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        Text("DogsListView")
    }
}
