//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Domain

public struct AllBreedsResponseDTO: Decodable {
    let message: [String: [String]]?
    let status: String?
}

extension AllBreedsResponseDTO {
    func toDomain() -> [DogBreed] {
        return message?.compactMap({ DogBreed(name: $0.key, categories: $0.value) }) ?? []
    }
}
