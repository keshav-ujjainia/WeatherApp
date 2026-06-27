//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Keshav * on 27/06/26.
//

import SwiftUI

import SwiftUI

@main
struct WeatherApp: App {

    var body: some Scene {

        WindowGroup {

            WeatherView(
                vm: AppContainer.shared.weatherViewModel
            )
        }
    }
}
