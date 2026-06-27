//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Keshav * on 27/06/26.
//

import Foundation

protocol WeatherService {

    func fetchWeather() async throws -> Weather

    func saveFavorite(city: String) async throws
}

final class WeatherServiceImpl: WeatherService {

    private let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func fetchWeather() async throws -> Weather {

        try await apiClient.request(
            endpoint: .getWeather
        )
    }

    func saveFavorite(city: String) async throws {

        try await apiClient.requestWithoutResponse(
            endpoint: .favorite(city: city)
        )
    }
}
