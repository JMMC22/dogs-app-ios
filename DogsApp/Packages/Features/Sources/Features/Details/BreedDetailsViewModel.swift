//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation

public class BreedDetailsViewModel: ObservableObject {
    
    private let breed: String

    public init(breed: String) {
        self.breed = breed
    }
}
