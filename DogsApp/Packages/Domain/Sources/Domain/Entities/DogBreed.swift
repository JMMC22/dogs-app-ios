//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation

public struct DogBreed {
    public let name: String
    public let categories: [String]

    public init(name: String, 
                categories: [String]) {
        self.name = name
        self.categories = categories
    }
}
