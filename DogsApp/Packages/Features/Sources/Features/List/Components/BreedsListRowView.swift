//
//  SwiftUIView.swift
//  
//
//  Created by Márquez Crespo, José María on 12/3/25.
//

import SwiftUI
import UI

struct BreedsListRowView: View {

    // MARK: Properties

    private let name: String
    private let action: () -> Void

    init(name: String, action: @escaping () -> Void) {
        self.name = name
        self.action = action
    }

    // MARK: Visual constants

    private enum VisualConstants {
        static let spacing: CGFloat = 8
    }

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: VisualConstants.spacing) {
            Text(name.capitalized)
                .dogFont(.Roboto(16, weight: .regular), color: .black)
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
        .onTapGesture {
            action()
        }
    }
}
