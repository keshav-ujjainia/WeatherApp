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

final class DefaultWeatherService: WeatherService {

    private let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func fetchWeather() async throws -> Weather {
        
        try await apiClient.request(
            endpoint: WeatherEndpoint.weather
        )
    }

    func saveFavorite(city: String) async throws {

        try await apiClient.request(
            endpoint: WeatherEndpoint.favorite(city: city)
        )
    }
}
