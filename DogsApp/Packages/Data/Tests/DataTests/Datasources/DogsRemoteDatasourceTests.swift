//
//  DogsRemoteDatasourceTests.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import XCTest
import Network
@testable import Data

final class DogsRemoteDatasourceTests: XCTestCase {

    func test_success_fetch_all_breeds_when_response_is_correct() async throws {
        // GIVEN
        let expectedResult = AllBreedsResponseDTO.mock()
        let stub = HTTPCLientStub(result: .success(expectedResult.toData()))
        let sut = DefaultDogsRemoteDatasource(httpClient: stub)

        // WHEN
        let capturedResult = await sut.fetchAllBreeds()

        // THEN
        let result = try XCTUnwrap(capturedResult.get())
        
        XCTAssertEqual(result, expectedResult)
    }

    func test_success_fetch_all_breeds_when_message_dictionary_is_empty() async throws {
        // GIVEN
        let expectedResult = AllBreedsResponseDTO(message: [:], status: "success")
        let stub = HTTPCLientStub(result: .success(expectedResult.toData()))
        let sut = DefaultDogsRemoteDatasource(httpClient: stub)

        // WHEN
        let capturedResult = await sut.fetchAllBreeds()

        // THEN
        let result = try XCTUnwrap(capturedResult.get())
        
        XCTAssertEqual(result, expectedResult)
    }

    func test_fail_fetch_all_breeds_when_client_fail() async throws {
        // GIVEN
        let expectedResult = RequestError.decode
        let stub = HTTPCLientStub(result: .failure(expectedResult))
        let sut = DefaultDogsRemoteDatasource(httpClient: stub)

        // WHEN
        let capturedResult = await sut.fetchAllBreeds()

        // THEN
        guard case .failure(let error) = capturedResult else {
            return
        }

        XCTAssertEqual(error, expectedResult)
    }
}
