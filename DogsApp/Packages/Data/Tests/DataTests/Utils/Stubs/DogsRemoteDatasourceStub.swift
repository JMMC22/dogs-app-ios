//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Network
@testable import Data

class DogsRemoteDatasourceStub: DogsRemoteDatasource {

    private let fetchAllBreedsResult: Result<AllBreedsResponseDTO, RequestError>

    init(fetchAllBreedsResult: Result<AllBreedsResponseDTO, RequestError> = .failure(.unknown)) {
        self.fetchAllBreedsResult = fetchAllBreedsResult
    }

    func fetchAllBreeds() async -> Result<AllBreedsResponseDTO, RequestError> {
        return fetchAllBreedsResult
    }
}
