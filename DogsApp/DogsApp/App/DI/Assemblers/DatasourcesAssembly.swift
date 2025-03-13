//
//  DatasourcesAssembly.swift
//  DogsApp
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Data
import Network
import Swinject

final class DatasourcesAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: Dogs remote datasource
        container.register(DogsRemoteDatasource.self) { resolver in
            guard let httpClient = resolver.resolve(HTTPClient.self) else {
                fatalError("HTTPClient dependency could not be resolved")
            }
            return DefaultDogsRemoteDatasource(httpClient: httpClient)
        }
    }
}
