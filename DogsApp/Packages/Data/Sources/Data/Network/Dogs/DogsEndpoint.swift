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
    case getRandomImageBy(breed: String)
}

extension DogsEndpoint: Endpoint {

    var host: String {
        return "dog.ceo"
    }

    var header: [String : String]? {
        switch self {
        case .getAllBreeds, .getRandomImageBy:
            return nil
        }
    }

    var path: String {
        switch self {
        case .getAllBreeds:
            return "/api/breeds/list/all"
        case .getRandomImageBy(breed: let breed):
            return "/api/breed/\(breed)/images/random"
        }
    }

    var method: HTTPMethodType {
        switch self {
        case .getAllBreeds, .getRandomImageBy:
            return .get
        }
    }

    var body: [String: Any]? {
        switch self {
        case .getAllBreeds, .getRandomImageBy:
            return nil
        }
    }

    var queryParameters: [URLQueryItem]? {
        switch self {
        case .getAllBreeds, .getRandomImageBy:
            return nil
        }
    }
}
