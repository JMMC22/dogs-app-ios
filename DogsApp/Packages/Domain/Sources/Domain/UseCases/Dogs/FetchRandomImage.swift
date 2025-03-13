//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation

public protocol FetchRandomImage {
    func execute(breed: String) async -> Result<URL, DogAppError>
}

public class DefaultFetchRandomImage {

    private let dogsImagesRepository: DogsImagesRepository

    public init(dogsImagesRepository: DogsImagesRepository) {
        self.dogsImagesRepository = dogsImagesRepository
    }
}

extension DefaultFetchRandomImage: FetchRandomImage {
    public func execute(breed: String) async -> Result<URL, DogAppError> {
        return await dogsImagesRepository.fetchRandomImageBy(breed: breed)
    }
}
