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

struct Endpoint {

    let path: String
    let method: HTTPMethod
    let body: Data?

    static let getWeather = Endpoint(
        path: "/weather",
        method: .get,
        body: nil
    )

    static func favorite(city: String) -> Endpoint {

        let body = try? JSONEncoder().encode(
            FavoriteRequest(city: city)
        )

        return Endpoint(
            path: "/favorite",
            method: .post,
            body: body
        )
    }
}
