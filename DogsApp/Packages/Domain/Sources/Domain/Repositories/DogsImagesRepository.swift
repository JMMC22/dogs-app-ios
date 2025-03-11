//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation

public protocol DogsImagesRepository {
    func fetchRandomImageBy(breed: String) async -> Result<URL, DogAppError>
}
