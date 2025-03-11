//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Network
@testable import Data

class HTTPCLientStub: HTTPClient {

    private let result: Result<Data, RequestError>

    init(result: Result<Data, RequestError>) {
        self.result = result
    }

    func request(endpoint: Endpoint) async -> Result<Data, RequestError> {
        return result
    }
}
