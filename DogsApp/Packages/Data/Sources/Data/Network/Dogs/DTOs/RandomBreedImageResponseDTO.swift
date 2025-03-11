//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Domain

public struct RandomBreedImageResponseDTO: Codable {
    public let message: String?
    public let status: String?
}

extension RandomBreedImageResponseDTO {
    func toDomain() -> BreedRandomImage {
        return BreedRandomImage(url: URL(string: message ?? ""))
    }
}
