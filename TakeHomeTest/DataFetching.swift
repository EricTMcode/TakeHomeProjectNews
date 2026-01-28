//
//  DataFetching.swift
//  TakeHomeTest
//
//  Created by Eric on 28/01/2026.
//

import Foundation

protocol DataFetching: Sendable {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: DataFetching { }
