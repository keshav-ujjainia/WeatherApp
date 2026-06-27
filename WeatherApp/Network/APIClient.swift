//
//  APIClient.swift
//  WeatherApp
//
//  Created by Keshav * on 27/06/26.
//

import Foundation

protocol APIClient {

    func request<T: Decodable>(
        endpoint: any Endpoint
    ) async throws -> T

    func request(
        endpoint: any Endpoint
    ) async throws
}
