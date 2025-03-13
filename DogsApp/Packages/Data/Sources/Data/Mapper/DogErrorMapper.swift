//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Domain
import Network

public class DogErrorMapper {

    public init() {}

    func map(error: Error) -> DogAppError {
        switch error {
        case let requestError as RequestError:
            return .network(requestError)
        default:
            return .generic
        }
    }
}
