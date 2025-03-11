//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
@testable import Data

extension AllBreedsResponseDTO: Equatable {
    public static func == (lhs: AllBreedsResponseDTO, rhs: AllBreedsResponseDTO) -> Bool {
        return lhs.message == rhs.message && lhs.status == rhs.status
    }
}
