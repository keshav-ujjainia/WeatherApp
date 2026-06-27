//
//  AppContainer.swift
//  WeatherApp
//
//  Created by Keshav * on 27/06/26.
//

import Foundation

final class AppContainer {

    static let shared = AppContainer()

    lazy var apiClient: APIClient = {
        URLSessionAPIClient()
    }()

    lazy var weatherService: WeatherService = {
        DefaultWeatherService(apiClient: apiClient)
    }()

    lazy var repository: WeatherRepository = {
        DefaultWeatherRepository(service: weatherService)
    }()

    lazy var weatherViewModel: WeatherViewModel = {
        WeatherViewModel(repository: repository)
    }()
}
