//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation

protocol FetchAllBreeds {
    func execute() async -> Result<[DogBreed], DogAppError>
}

class DefaultFetchAllBreeds {

    private let dogsRepository: DogsRepository

    init(dogsRepository: DogsRepository) {
        self.dogsRepository = dogsRepository
    }
}

extension DefaultFetchAllBreeds: FetchAllBreeds {
    func execute() async -> Result<[DogBreed], DogAppError> {
        return await dogsRepository.fetchAllBreeds()
    }
}
