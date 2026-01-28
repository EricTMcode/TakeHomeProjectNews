//
//  TakeHomeTestsTests.swift
//  TakeHomeTestTests
//
//  Created by Eric on 28/01/2026.
//

@testable import TakeHomeTest
import Foundation
import Testing

@MainActor
struct TakeHomeTestsTests {
    @Test func viewModelStartsEmpty() async throws {
        let viewModel = ArticlesListView.ViewModel()

        #expect(viewModel.articles.isEmpty, "There should be no articles initialy.")
    }

    @Test func viewModelLoadsArticles() async throws {
        let viewModel = ArticlesListView.ViewModel()
        await viewModel.loadArticles()

        #expect(viewModel.articles.isEmpty == false, "There should be article after loading")
    }
}
