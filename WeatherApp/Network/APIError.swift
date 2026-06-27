//
//  APIError.swift
//  WeatherApp
//
//  Created by Keshav * on 27/06/26.
//

import Foundation

enum APIError: Error {

    case invalidURL
    case invalidResponse
    case decodingFailed
    case serverError
    case unauthorized
}
