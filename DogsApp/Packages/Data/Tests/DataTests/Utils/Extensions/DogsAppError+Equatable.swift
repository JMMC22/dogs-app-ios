//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Domain
@testable import Data

extension DogAppError: Equatable {
    public static func == (lhs: DogAppError, rhs: DogAppError) -> Bool {
        switch (lhs, rhs) {
        case (.network(let lherror), .network(let rherror)):
            return lherror == rherror
        case (.generic, .generic):
            return true
        case (.unknown, .unknown):
            return true
        default:
            return false
        }
    }
}
