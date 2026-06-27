//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Keshav * on 27/06/26.
//

import Foundation
import Combine

@MainActor
final class WeatherViewModel: ObservableObject {

    @Published var weather: Weather?

    @Published var isLoading = false

    @Published var errorMessage = ""

    private let repository: WeatherRepository

    init(repository: WeatherRepository) {
        self.repository = repository
    }

    func loadWeather() {

        Task {

            isLoading = true

            defer {
                isLoading = false
            }

            do {

                weather = try await repository.getWeather()

            }
            catch {

                errorMessage = error.localizedDescription
            }
        }
    }

    func saveFavorite() {

        guard let city = weather?.city else {
            return
        }

        Task {

            do {

                try await repository.saveFavorite(city: city)

            }
            catch {

                errorMessage = error.localizedDescription
            }
        }
    }
}
