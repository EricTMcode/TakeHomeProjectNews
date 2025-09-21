//
//  ViewModel.swift
//  TakeHomeTest
//
//  Created by Eric on 20/09/2025.
//

import Foundation

extension ContentView {
    @Observable @MainActor

    class ViewModel {
        private(set) var articles = [Article]()

        private(set) var loadstate = LoadState.loading
        private(set) var loadError: (any Error)?

        func loadArticles() async {
            do {
                let url = URL(string: "https://hws.dev/news")!
                let (data, _) = try await URLSession.shared.data(from: url)

                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601

                articles = try decoder.decode([Article].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    enum LoadState {
        case loading, loaded, failed
    }
}
