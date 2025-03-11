//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Domain

public struct AllBreedsResponseDTO: Codable {
    public let message: [String: [String]]?
    public let status: String?
}

extension AllBreedsResponseDTO {
    func toDomain() -> [DogBreed] {
        return message?.compactMap({ DogBreed(name: $0.key, categories: $0.value) }) ?? []
    }
}
