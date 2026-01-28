//
//  ContentView.swift
//  TakeHomeTest
//
//  Created by Eric on 10/07/2025.
//

import SwiftUI

struct ArticlesListView: View {
    @State private var viewModel = ViewModel()

    var body: some View {
        NavigationStack {
            switch viewModel.loadState {
            case .failed:
                LoadFailedView(error: viewModel.loadError, retry: viewModel.loadArticles)
            default:
                if viewModel.articles.isEmpty {
                    ProgressView("Loading...")
                        .controlSize(.extraLarge)
                } else {
                    List(viewModel.articles, rowContent: ArticleRow.init)
                        .navigationTitle("Take Home Test")
                        .navigationDestination(for: Article.self, destination: ArticleView.init)
                        .refreshable(action: viewModel.loadArticles)
                }
            }
        }
        .task(viewModel.loadArticles)
    }
}

#Preview {
    ArticlesListView()
}
