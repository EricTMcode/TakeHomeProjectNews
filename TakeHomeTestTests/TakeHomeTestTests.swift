//
//  TakeHomeTestTests.swift
//  TakeHomeTestTests
//
//  Created by Eric on 10/07/2025.
//

@testable import TakeHomeTest
import Foundation
import Testing

@MainActor
struct TakeHomeTestTests {
    @Test func viewModelStartsEmpty() {
        let viewModel = ContentView.ViewModel()
        #expect(viewModel.articles.isEmpty, "There should be no articles initially.")
        #expect(viewModel.loadState == .loading, "The view model should start in the loading state.")
    }

    @Test func viewModelLoadsArticles() async throws {
        let viewModel = try ContentView.ViewModel(session: createMockURLSession())
        await viewModel.loadArticles()
        #expect(viewModel.articles.isEmpty == false, "There should be articles after loading")
        #expect(viewModel.loadState == .loaded, "The view model should finish loading in the loaded state.")
    }

    @Test func viewModelFilteringFull() async throws {
        let viewModel = try ContentView.ViewModel(session: createMockURLSession())
        await viewModel.loadArticles()
        #expect(viewModel.filteredArticles == viewModel.articles, "Without a filter attached, all articles should be shown")
    }

    @Test func viewModelFilteringExact() async throws {
        let viewModel = try ContentView.ViewModel(session: createMockURLSession())
        await viewModel.loadArticles()
        viewModel.filterText = viewModel.articles.first?.title ?? ""
        #expect(viewModel.filteredArticles.count == 1, "Filtering for an exact article should show only 1 result.")
    }

    @Test func viewModelFilteringEmpty() async throws {
        let viewModel = try ContentView.ViewModel(session: createMockURLSession())
        await viewModel.loadArticles()
        viewModel.filterText = "XXX NOT HAPPENING XXX"
        #expect(viewModel.filteredArticles.isEmpty, "With an impossible article title, no articles should be shown.")

    }

    func createMockURLSession() throws -> URLSessionMock {
        let articles = [Article.example]
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601

        let articleData = try encoder.encode(articles)
        return URLSessionMock(data: articleData)
    }

}
