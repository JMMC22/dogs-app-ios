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
    @Published var searchText: String = ""

    // MARK: Use cases
    private let fetchAllBreeds: FetchAllBreeds

    public init(fetchAllBreeds: FetchAllBreeds) {
        self.fetchAllBreeds = fetchAllBreeds
    }

    func viewOnAppear() {
        setupSearch()
        fetchAllDogsBreeds()
    }
}

// MARK: Remote requests
extension DogsListViewModel {
    func fetchAllDogsBreeds() {
        Task {
            let result = await fetchAllBreeds.execute()
            
            switch result {
            case .success(let breeds):
                self.fetchAllBreedsDidSuccess(breeds: breeds)
            case .failure(let error):
                self.fetchAllBreedsDidFail(error: error)
            }
        }
    }

    private func fetchAllBreedsDidSuccess(breeds: [DogBreed]) {
        DispatchQueue.main.async {
            self.breeds = breeds
        }
    }

    private func fetchAllBreedsDidFail(error: DogAppError) {
        print(error.localizedDescription)
    }
}

// MARK: Search
extension DogsListViewModel {
    private func setupSearch() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main) // Reduce llamadas innecesarias
            .removeDuplicates()
            .map { searchText in
                searchText.isEmpty ? self.breeds : self.breeds.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            }
            .assign(to: &$breeds)
    }
}
