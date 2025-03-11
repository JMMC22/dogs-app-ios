//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation

public protocol FetchAllBreeds {
    func execute() async -> Result<[DogBreed], DogAppError>
}

public class DefaultFetchAllBreeds {

    private let dogsRepository: DogsRepository

    public init(dogsRepository: DogsRepository) {
        self.dogsRepository = dogsRepository
    }
}

extension DefaultFetchAllBreeds: FetchAllBreeds {
    public func execute() async -> Result<[DogBreed], DogAppError> {
        return await dogsRepository.fetchAllBreeds()
    }
}
