//
//  NetworkAssembler.swift
//  DogsApp
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Network
import Swinject

final class NetworkAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: HTTPClient
        container.register(HTTPClient.self) { _ in
            return DefaultHTTPClient()
        }
    }
}
