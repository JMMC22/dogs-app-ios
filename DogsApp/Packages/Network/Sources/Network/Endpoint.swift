//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 11/3/25.
//

import Foundation

public protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: HTTPMethodType { get }
    var header: [String: String]? { get }
    var body: [String: Any]? { get }
    var queryParameters: [URLQueryItem]? { get }
}

public extension Endpoint {
    var scheme: String {
        return "https"
    }
}
