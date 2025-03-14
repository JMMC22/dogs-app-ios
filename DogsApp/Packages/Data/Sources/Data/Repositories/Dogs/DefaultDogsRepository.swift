//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Domain

public class DefaultDogsRepository {

    private let remoteDatasource: DogsRemoteDatasource
    private let errorMapper: DogErrorMapper

    public init(remoteDatasource: DogsRemoteDatasource,
                errorMapper: DogErrorMapper) {
        self.remoteDatasource = remoteDatasource
        self.errorMapper = errorMapper
    }
}

extension DefaultDogsRepository: DogsRepository {
    public func fetchAllBreeds() async -> Result<[DogBreed], DogAppError> {
        let result = await remoteDatasource.fetchAllBreeds()

        switch result {
        case .success(let response):
            return .success(response.toDomain())
        case .failure(let error):
            return .failure(errorMapper.map(error: error))
        }
    }
}
