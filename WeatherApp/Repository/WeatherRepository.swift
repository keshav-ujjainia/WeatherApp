//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Keshav * on 27/06/26.
//

import Foundation

protocol WeatherRepository {
    func getWeather() async throws -> Weather
    func saveFavorite(city: String) async throws
}

final class DefaultWeatherRepository: WeatherRepository {

    private let service: WeatherService

    init(service: WeatherService) {
        self.service = service
    }

    func getWeather() async throws -> Weather {
        try await service.fetchWeather()
    }

    func saveFavorite(city: String) async throws {
        try await service.saveFavorite(city: city)
    }
}
