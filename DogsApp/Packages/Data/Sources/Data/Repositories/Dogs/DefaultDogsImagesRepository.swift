//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Domain

public class DefaultDogsImagesRepository {

    private let remoteDatasource: DogsRemoteDatasource
    private let errorMapper: DogErrorMapper

    public init(remoteDatasource: DogsRemoteDatasource,
                errorMapper: DogErrorMapper) {
        self.remoteDatasource = remoteDatasource
        self.errorMapper = errorMapper
    }
}

extension DefaultDogsImagesRepository: DogsImagesRepository {
    public func fetchRandomImageBy(breed: String) async -> Result<URL, DogAppError> {
        let result = await remoteDatasource.fetchRandomImageBy(breed: breed)

        switch result {
        case .success(let image):
            let image = image.toDomain()

            guard let imageURL = image.url else {
                return .failure(.generic)
            }

            return .success(imageURL)
        case .failure(let error):
            return .failure(errorMapper.map(error: error))
        }
    }
}

