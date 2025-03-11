//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Domain

public class DogsListViewModel: ObservableObject {

    @Published var breeds: [DogBreed] = []

    // MARK: Use cases
    private let fetchAllBreeds: FetchAllBreeds

    public init(fetchAllBreeds: FetchAllBreeds) {
        self.fetchAllBreeds = fetchAllBreeds
    }

    func viewOnAppear() {
        Task {
            await fetchAllBreeds()
        }
    }
}

// MARK: Remote requests
extension DogsListViewModel {
    func fetchAllBreeds() async {
        let result = await fetchAllBreeds.execute()

        switch result {
        case .success(let breeds):
            self.fetchAllBreedsDidSuccess(breeds: breeds)
        case .failure(let error):
            self.fetchAllBreedsDidFail(error: error)
        }
    }

    private func fetchAllBreedsDidSuccess(breeds: [DogBreed]) {
        self.breeds = breeds
    }

    private func fetchAllBreedsDidFail(error: DogAppError) {
        print(error.localizedDescription)
    }
}
