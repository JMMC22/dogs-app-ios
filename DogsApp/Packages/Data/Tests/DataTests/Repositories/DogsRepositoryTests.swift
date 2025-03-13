//
//  DogsRepositoryTests.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import XCTest
import Network
@testable import Data

final class DogsRepositoryTests: XCTestCase {

    func test_success_fetch_all_breeds_when_remote_response_is_correct() async throws {
        // GIVEN
        let expectedResult = AllBreedsResponseDTO.mock()
        let stub = DogsRemoteDatasourceStub(fetchAllBreedsResult: .success(expectedResult))
        let sut = DefaultDogsRepository(remoteDatasource: stub,
                                        errorMapper: DogErrorMapper())

        // WHEN
        let capturedResult = await sut.fetchAllBreeds()

        // THEN
        let result = try XCTUnwrap(capturedResult.get())

        XCTAssertFalse(result.isEmpty)
    }

    func test_success_fetch_all_breeds_when_remote_response_is_empty_array() async throws {
        // GIVEN
        let expectedResult = AllBreedsResponseDTO(message: [:], status: "")
        let stub = DogsRemoteDatasourceStub(fetchAllBreedsResult: .success(expectedResult))
        let sut = DefaultDogsRepository(remoteDatasource: stub,
                                        errorMapper: DogErrorMapper())

        // WHEN
        let capturedResult = await sut.fetchAllBreeds()

        // THEN
        let result = try XCTUnwrap(capturedResult.get())

        XCTAssertTrue(result.isEmpty)
    }

    func test_fail_fetch_all_breeds_when_remote_response_is_error() async throws {
        // GIVEN
        let expectedResult = RequestError.decode
        let stub = DogsRemoteDatasourceStub(fetchAllBreedsResult: .failure(expectedResult))
        let errorMapper = DogErrorMapper()
        let sut = DefaultDogsRepository(remoteDatasource: stub,
                                        errorMapper: errorMapper)

        // WHEN
        let capturedResult = await sut.fetchAllBreeds()

        // THEN
        guard case .failure(let error) = capturedResult else {
            return
        }

        let expectedError = errorMapper.map(error: expectedResult)
        XCTAssertEqual(error, expectedError)
    }

}
