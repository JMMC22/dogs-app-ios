//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation

public class NavigationRouter: ObservableObject {
    @Published public var event: AppNavigationEvent?

    public init(event: AppNavigationEvent? = nil) {
        self.event = event
    }
}
