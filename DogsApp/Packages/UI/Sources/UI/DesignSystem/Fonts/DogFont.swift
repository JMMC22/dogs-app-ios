//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 12/3/25.
//

import Foundation
import SwiftUI

public struct DogFont {

    let font: UIFont

    public static func Roboto(_ size: CGFloat, weight: FontWeight) -> DogFont {
        let font = UIFont.font(type: .roboto, weight: weight, size: size)
        return DogFont(font: font)
    }
}

public struct DogFontModifier: ViewModifier {

    let font: DogFont
    let color: Color

    public func body(content: Content) -> some View {
        content
            .font(Font(self.font.font))
            .foregroundColor(color)
    }
}

extension View {
    public func dogFont(_ font: DogFont, color: Color) -> some View {
        modifier(DogFontModifier(font: font, color: color))
    }
}
