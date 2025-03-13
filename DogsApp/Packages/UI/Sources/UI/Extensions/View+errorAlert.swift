//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 12/3/25.
//

import Foundation
import SwiftUI

public extension View {
    func errorAlert(isPresented: Binding<Bool>,
                    message: String = "Generic Error",
                    title: String = "OK") -> some View {
        return alert(isPresented: isPresented) {
            Alert(
                title: Text("Error"),
                message: Text(message),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
