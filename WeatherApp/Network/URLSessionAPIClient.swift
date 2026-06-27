//
//  URLSessionAPIClient.swift
//  WeatherApp
//
//  Created by Keshav * on 27/06/26.
//

import Foundation

final class URLSessionAPIClient: APIClient {

    func request<T: Decodable>(
        endpoint: any Endpoint
    ) async throws -> T {

        guard let url = URL(string: Constants.baseURL + endpoint.path) else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body
        request.timeoutInterval = Constants.Network.requestTimeout
        request.setValue(
            Constants.Network.contentType,
            forHTTPHeaderField: "Content-Type"
        )
        
        endpoint.headers.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let response = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        guard (200...299).contains(response.statusCode) else {
            throw APIError.serverError
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decodingFailed
        }
    }

    func request(
        endpoint: any Endpoint
    ) async throws {

        guard let url = URL(string: Constants.baseURL + endpoint.path) else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body
        request.timeoutInterval = Constants.Network.requestTimeout
        request.setValue(
            Constants.Network.contentType,
            forHTTPHeaderField: "Content-Type"
        )

        endpoint.headers.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }

        let (_, response) = try await URLSession.shared.data(for: request)

        guard let response = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        guard (200...299).contains(response.statusCode) else {
            throw APIError.serverError
        }
    }
}
