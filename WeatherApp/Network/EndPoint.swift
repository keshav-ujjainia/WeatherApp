//
//  EndPoint.swift
//  WeatherApp
//
//  Created by Keshav * on 27/06/26.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol Endpoint {

    var path: String { get }

    var method: HTTPMethod { get }

    var headers: [String: String] { get }

    var body: Data? { get }
}

enum WeatherEndpoint: Endpoint {

    case weather

    case favorite(city: String)

    var path: String {

        switch self {

        case .weather:
            return "/weather"

        case .favorite:
            return "/favorite"
        }
    }

    var method: HTTPMethod {

        switch self {

        case .weather:
            return .get

        case .favorite:
            return .post
        }
    }

    var headers: [String: String] {

        [
            "Content-Type": "application/json"
        ]
    }

    var body: Data? {

        switch self {

        case .weather:
            return nil

        case .favorite(let city):

            return try? JSONEncoder().encode(
                FavoriteRequest(city: city)
            )
        }
    }
}
