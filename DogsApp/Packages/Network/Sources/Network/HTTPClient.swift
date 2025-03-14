//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation

public protocol HTTPClient {
    func request(endpoint: Endpoint) async -> Result<Data, RequestError>
}
