//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Keshav * on 27/06/26.
//

import SwiftUI

struct WeatherView: View {

    @StateObject var vm: WeatherViewModel

    var body: some View {

        VStack(spacing: 20) {

            if vm.isLoading {

                ProgressView()

            }
            else if let weather = vm.weather {

                Text(weather.city)
                    .font(.largeTitle)

                Text("\(weather.temperature)°")

                Text(weather.condition)

                Button("Favorite") {
                    vm.saveFavorite()
                }
            }

            Button("Refresh") {
                vm.loadWeather()
            }

            Text(vm.errorMessage)
                .foregroundColor(.red)
        }
        .padding()
        .task {
            vm.loadWeather()
        }
    }
}

#Preview {
    WeatherView(vm: WeatherViewModel(repository: PreviewWeatherRepository()))
}

private class PreviewWeatherRepository: WeatherRepository {
    func getWeather() async throws -> Weather {
        Weather(city: "London", temperature: 22, condition: "Sunny")
    }
    func saveFavorite(city: String) async throws {}
}
