//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Network

public enum DogAppError: Error {
    case generic
    case network(RequestError)
    case unknown
}

extension DogAppError {

    var localizedDescription: String {
        switch self {
        case .generic:
            return "An unexpected error occurred."
        case .network(let requestError):
            return "Network error: \(requestError.localizedDescription)"
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
