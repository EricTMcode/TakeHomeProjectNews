//
//  URLSessionMock.swift
//  TakeHomeTestTests
//
//  Created by Eric on 28/01/2026.
//

@testable import TakeHomeTest
import Foundation

struct URLSessionMock: DataFetching {
    var data: Data

    func data(from url: URL) async throws -> (Data, URLResponse) {
        (data, URLResponse())
    }

}
