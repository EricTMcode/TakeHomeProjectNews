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
            switch viewModel.loadstate {
            case .failed:
                ContentUnavailableView {
                    Text("Load Error")
                        .font(.headline)
                } description: {
                    Text("There was an error loading the articles.")
                } actions: {
                    Button("Retry") {
                        Task {
                            await viewModel.loadArticles()
                        }
                    }
                }
                
            default:
                if viewModel.articles.isEmpty {
                    ProgressView("Loading..")
                        .controlSize(.extraLarge)
                } else {
                    List(viewModel.articles, rowContent: ArticleRow.init)
                        .navigationTitle("Take Home Test")
                        .navigationDestination(for: Article.self, destination: ArticleView.init)
                }
            }
            //            List(viewModel.articles) { article in
            //                ArticleRow(article: article)
            //            }

            //            .navigationDestination(for: Article.self) { article in
            //                ArticleView(article: article)
            //            }

        }
        .task(viewModel.loadArticles)
    }
}

#Preview {
    ContentView()
}
