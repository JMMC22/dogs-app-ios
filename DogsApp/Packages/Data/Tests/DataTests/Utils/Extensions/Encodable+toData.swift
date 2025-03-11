//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation

extension Encodable {
    func toData(prettyPrinted: Bool = false) -> Data {
        let encoder = JSONEncoder()
        if prettyPrinted {
            encoder.outputFormatting = .prettyPrinted
        }
        return (try? encoder.encode(self)) ?? Data()
    }
}
