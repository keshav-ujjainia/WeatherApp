//
//  Weather.swift
//  WeatherApp
//
//  Created by Keshav * on 27/06/26.
//

import Foundation

struct Weather: Codable {
    let city: String
    let temperature: Double
    let condition: String
}
