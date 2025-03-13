//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation
@testable import Data

extension AllBreedsResponseDTO {
    static func mock() -> AllBreedsResponseDTO {
        AllBreedsResponseDTO(message: ["affenpinscher": [],
                                       "african": [],
                                       "airedale": [],
                                       "akita": [],
                                       "appenzeller": [],
                                       "australian": [
                                        "kelpie",
                                        "shepherd"
                                       ],
                                       "bakharwal": [
                                        "indian"
                                       ]
                                      ], status: "success")
    }
}
