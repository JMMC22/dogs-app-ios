//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Network

protocol DogsRemoteDatasource {
    func fetchAllBreeds() async -> Result<AllBreedsResponseDTO, RequestError>
}

class DefaultDogsRemoteDatasource {

    private let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
}

extension DefaultDogsRemoteDatasource: DogsRemoteDatasource {
    func fetchAllBreeds() async -> Result<AllBreedsResponseDTO, RequestError> {
        let endpoint = DogsEndpoint.getAllBreeds
        let result = await httpClient.request(endpoint: endpoint)

        switch result {
        case .success(let response):
            guard let response = try? JSONDecoder().decode(AllBreedsResponseDTO.self,
                                                           from: response) else {
                return .failure(.decode)
            }
            return .success(response)
        case .failure(let error):
            return .failure(error)
        }
    }
}
