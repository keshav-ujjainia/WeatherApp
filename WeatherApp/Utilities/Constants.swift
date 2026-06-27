//
//  Constants.swift
//  WeatherApp
//
//  Created by Keshav * on 27/06/26.
//

import Foundation

enum Constants {
    
    enum Environment {
            case development
            case staging
            case production
        }

    static let currentEnvironment: Environment = .development

    static var baseURL: String {

        switch currentEnvironment {

        case .development:
            return "https://dev.api.example.com"

        case .staging:
            return "https://staging.api.example.com"

        case .production:
            return "https://api.example.com"
        }
    }

    enum Network {

        static let requestTimeout: TimeInterval = 30

        static let contentType = "application/json"

        static let accept = "application/json"
    }

    enum UI {

        static let navigationTitle = "Weather"

        static let refreshButtonTitle = "Refresh"

        static let favoriteButtonTitle = "Favorite"
    }
}
