//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Network

enum DogsEndpoint {
    case getAllBreeds
}

extension DogsEndpoint: Endpoint {

    var host: String {
        return "dog.ceo"
    }

    var header: [String : String]? {
        switch self {
        case .getAllBreeds:
            return nil
        }
    }

    var path: String {
        switch self {
        case .getAllBreeds:
            return "/api/breeds/list/all"
        }
    }

    var method: HTTPMethodType {
        switch self {
        case .getAllBreeds:
            return .get
        }
    }

    var body: [String: Any]? {
        switch self {
        case .getAllBreeds:
            return nil
        }
    }

    var queryParameters: [URLQueryItem]? {
        switch self {
        case .getAllBreeds:
            return nil
        }
    }
}
