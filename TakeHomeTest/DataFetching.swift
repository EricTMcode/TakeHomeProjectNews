//
//  DataFetching.swift
//  TakeHomeTest
//
//  Created by Eric on 22/09/2025.
//

import Foundation

protocol DataFetching: Sendable {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: DataFetching { }
