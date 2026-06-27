//
//  APIClient.swift
//  WeatherApp
//
//  Created by Keshav * on 27/06/26.
//

import Foundation

protocol APIClient {

    func request<T: Decodable>(
        endpoint: Endpoint
    ) async throws -> T

    func requestWithoutResponse(
        endpoint: Endpoint
    ) async throws
}
