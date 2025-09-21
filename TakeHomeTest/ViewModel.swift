//
//  ViewModel.swift
//  TakeHomeTest
//
//  Created by Eric on 20/09/2025.
//

import Foundation

extension ContentView {
    enum LoadState {
        case loading, loaded, failed
    }

    @Observable @MainActor
    class ViewModel {
        private(set) var articles = [Article]()

        private(set) var loadstate = LoadState.loading
        private(set) var loadError: (any Error)?

        func loadArticles() async {
            loadstate = .loading

            do {
                let url = URL(string: "https://hws.dev/news")!
                let (data, _) = try await URLSession.shared.data(from: url)

                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601

                articles = try decoder.decode([Article].self, from: data)
                loadstate = .loaded
            } catch {
                print(error.localizedDescription)
                loadstate = .failed
                loadError = error
            }
        }
    }

}
