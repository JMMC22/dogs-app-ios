//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Domain

public class BreedsListViewModel: ObservableObject {

    // MARK: - UI properties

    @Published var breeds: [DogBreed] = []
    @Published var searchText: String = ""
    @Published var error: DogAppError?
    @Published var isLoading: Bool = false

    // MARK: - Use cases

    private let fetchAllBreeds: FetchAllBreeds

    // MARK: - Private properties

    private var allBreeds: [DogBreed] = []

    public init(fetchAllBreeds: FetchAllBreeds) {
        self.fetchAllBreeds = fetchAllBreeds
    }

    func viewOnAppear() {
        setupSearch()
        fetchAllDogsBreeds()
    }
}

// MARK: - Remote requests

extension BreedsListViewModel {
    func fetchAllDogsBreeds() {
        isLoading = true
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
        allBreeds = breeds

        DispatchQueue.main.async {
            self.breeds = breeds
            self.isLoading = false
        }
    }

    private func fetchAllBreedsDidFail(error: DogAppError) {
        DispatchQueue.main.async {
            self.error = error
            self.isLoading = false
        }
    }
}

// MARK: - Search

extension BreedsListViewModel {
    private func setupSearch() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .map(handleFilter)
            .assign(to: &$breeds)
    }

    private func handleFilter(value: String) -> [DogBreed] {
        searchText.isEmpty ? self.allBreeds : self.filter()
    }

    private func filter() -> [DogBreed] {
        self.allBreeds.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
}
