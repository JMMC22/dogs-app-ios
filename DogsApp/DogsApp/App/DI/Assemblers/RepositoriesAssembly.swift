//
//  RepositoriesAssembly.swift
//  DogsApp
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Data
import Domain
import Network
import Swinject

final class RepositoriesAssembly: Assembly {

    func assemble(container: Container) {
        
        // MARK: Dogs repository
        container.register(DogsRepository.self) { resolver in
            guard let remoteDatasource = resolver.resolve(DogsRemoteDatasource.self) else {
                fatalError("DogsRemoteDatasource dependency could not be resolved")
            }
            return DefaultDogsRepository(remoteDatasource: remoteDatasource,
                                         errorMapper: DogErrorMapper())
        }
    }
}
