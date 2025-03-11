//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation

struct AllBreedsResponseDTO: Decodable {
    let message: [String: [String]]?
    let status: String?
}
