//
//  URLSessionMock.swift
//  TakeHomeTestTests
//
//  Created by Eric on 10/07/2025.
//

@testable import TakeHomeTest
import Foundation

struct URLSessionMock: DataFetching {
    var data: Data

    func data(from url: URL) async throws -> (Data, URLResponse) {
        (data, URLResponse())
    }
}
