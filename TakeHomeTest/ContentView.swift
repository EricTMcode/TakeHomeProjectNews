//
//  ContentView.swift
//  TakeHomeTest
//
//  Created by Eric on 10/07/2025.
//

import SwiftUI

struct ContentView: View {
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
                    List(viewModel.filteredArticles, rowContent: ArticleRow.init)
                    //            List(viewModel.articles) { article in
                    //                ArticleRow(article: article)
                    //            }
                        .navigationTitle("News")
                        .navigationDestination(for: Article.self, destination: ArticleView.init)
                        .refreshable(action: viewModel.loadArticles)
                        .searchable(text: $viewModel.filterText, prompt: "Filter articles")
                    //            .navigationDestination(for: Article.self) { article in
                    //                ArticleView(article: article)
                    //            }
                }
            }
        }
        .task(viewModel.loadArticles)
    }
}

#Preview {
    ContentView()
}
