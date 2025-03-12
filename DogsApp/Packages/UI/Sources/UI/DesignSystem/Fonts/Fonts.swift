//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 12/3/25.
//

import Foundation
import SwiftUI

enum FontType: String {
    case roboto

    var name: String {
        self.rawValue.capitalized
    }
}

public enum FontWeight: String {
    case black
    case bold
    case regular
    case semiBold

    var name: String {
        "-" + self.rawValue.capitalized
    }
}

extension Font {
    static func font(type: FontType, weight: FontWeight, size: CGFloat) -> Font {
        .custom(type.name + weight.name, size: size)
    }
}

extension UIFont {
    class func font(type: FontType, weight: FontWeight, size: CGFloat) -> UIFont {
        let fontName = type.name + weight.name

        if let font = UIFont(name: fontName, size: size) {
            return font
        }

        registerFontIfNeeded(named: fontName)
        return UIFont(name: type.name + weight.name, size: size) ?? UIFont.systemFont(ofSize: size)
    }

    private static func registerFontIfNeeded(named fontName: String) {
        guard let fontURL = Bundle.module.url(forResource: fontName, withExtension: "ttf") else {
            print("[UI] - Font \(fontName).ttf not found in the package")
            return
        }

        guard let fontData = try? Data(contentsOf: fontURL),
              let provider = CGDataProvider(data: fontData as CFData),
              let font = CGFont(provider) else {
            print("[UI] - Failed to create font from \(fontURL)")
            return
        }

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            print("[UI] - Error registering font \(fontName): \(error!.takeRetainedValue())")
        } else {
            print("[UI] - Font \(fontName) registered successfully")
        }
    }
}

