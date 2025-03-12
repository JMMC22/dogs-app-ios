//
//  UseCasesAssembly.swift
//  DogsApp
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Data
import Domain
import Network
import Swinject

final class UseCasesAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: Fetch all breeds use case
        container.register(FetchAllBreeds.self) { resolver in
            guard let dogsRepository = resolver.resolve(DogsRepository.self) else {
                fatalError("DogsRepository dependency could not be resolved")
            }
            return DefaultFetchAllBreeds(dogsRepository: dogsRepository)
        }

        // MARK: Fetch randome breed image use case
        container.register(FetchRandomImage.self) { resolver in
            guard let dogsImagesRepository = resolver.resolve(DogsImagesRepository.self) else {
                fatalError("DogsImagesRepository dependency could not be resolved")
            }
            return DefaultFetchRandomImage(dogsImagesRepository: dogsImagesRepository)
        }
    }
}
