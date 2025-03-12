//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
import Domain

public class BreedDetailsViewModel: ObservableObject {

    @Published var imageURL: URL?

    private let breed: String
    private let fetchRandomImage: FetchRandomImage

    public init(breed: String, fetchRandomImage: FetchRandomImage) {
        self.breed = breed
        self.fetchRandomImage = fetchRandomImage
    }

    func viewDidAppear() {
        fecthRandomImage()
    }
}

// MARK: Fetch image
extension BreedDetailsViewModel {
    private func fecthRandomImage() {
        Task {
            let result = await fetchRandomImage.execute(breed: breed)
            
            switch result {
            case .success(let url):
                self.fecthRandomImageDidSuccess(url: url)
            case .failure(let error):
                self.fecthRandomImageDidFail(error: error)
            }
        }
    }

    private func fecthRandomImageDidSuccess(url: URL) {
        DispatchQueue.main.async {
            self.imageURL = url
        }
    }

    private func fecthRandomImageDidFail(error: DogAppError) {
        print(error.localizedDescription)
    }
}
