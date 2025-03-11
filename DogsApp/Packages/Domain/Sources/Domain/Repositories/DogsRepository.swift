//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation

public protocol DogsRepository {
    func fetchAllBreeds() async -> Result<[DogBreed], DogAppError>
}
