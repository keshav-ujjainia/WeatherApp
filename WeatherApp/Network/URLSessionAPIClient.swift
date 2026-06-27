//
//  URLSessionAPIClient.swift
//  WeatherApp
//
//  Created by Keshav * on 27/06/26.
//

import Foundation

final class URLSessionAPIClient: APIClient {

    private let baseURL = "https://api.example.com"

    func request<T: Decodable>(
        endpoint: Endpoint
    ) async throws -> T {

        guard let url = URL(string: baseURL + endpoint.path)
        else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body

        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )

        let (data, response) = try await URLSession.shared.data(for: request)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw APIError.serverError
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        }
        catch {
            throw APIError.decodingFailed
        }
    }

    func requestWithoutResponse(
        endpoint: Endpoint
    ) async throws {

        guard let url = URL(string: baseURL + endpoint.path)
        else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body

        let (_, response) = try await URLSession.shared.data(for: request)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw APIError.serverError
        }
    }
}
