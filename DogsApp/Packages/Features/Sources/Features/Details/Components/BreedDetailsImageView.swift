//
//  SwiftUIView.swift
//  
//
//  Created by Márquez Crespo, José María on 12/3/25.
//

import SwiftUI

struct BreedDetailsImageView: View {

    // MARK: - Properties
    private let imageURL: URL?

    init(imageURL: URL?) {
        self.imageURL = imageURL
    }

    // MARK: Visual constants

    private enum VisualConstants {
        static let cornerRadius: CGFloat = 16
        static let lineWidth: CGFloat = 3
        static let strokeColor = Color.black.opacity(0.4)
    }

    var body: some View {
        GeometryReader { geometry in
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: VisualConstants.cornerRadius))
                    .overlay(
                        RoundedRectangle(cornerRadius: VisualConstants.cornerRadius)
                            .stroke(VisualConstants.strokeColor, lineWidth: VisualConstants.lineWidth)
                    )
            } placeholder: {
                ProgressView()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .overlay(
                        RoundedRectangle(cornerRadius: VisualConstants.cornerRadius)
                            .stroke(VisualConstants.strokeColor, lineWidth: VisualConstants.lineWidth)
                    )
            }
        }
        .frame(height: UIScreen.main.bounds.height * 0.4)
    }
}
