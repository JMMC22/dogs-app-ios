//
//  SwiftUIView.swift
//  
//
//  Created by Márquez Crespo, José María on 12/3/25.
//

import SwiftUI

struct BreedsListRowView: View {

    private let name: String
    private let action: () -> Void

    init(name: String, action: @escaping () -> Void) {
        self.name = name
        self.action = action
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(name.capitalized)
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
        .onTapGesture {
            action()
        }
    }
}
