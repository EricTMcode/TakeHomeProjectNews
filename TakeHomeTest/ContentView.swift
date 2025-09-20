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
            List(viewModel.articles, rowContent: ArticleRow.init)

            //            List(viewModel.articles) { article in
            //                ArticleRow(article: article)
            //            }

                .navigationDestination(for: Article.self, destination: ArticleView.init)
            
            //            .navigationDestination(for: Article.self) { article in
            //                ArticleView(article: article)
            //            }


                .navigationTitle("Take Home Test")
        }
        .task(viewModel.loadArticles)
    }
}

#Preview {
    ContentView()
}
