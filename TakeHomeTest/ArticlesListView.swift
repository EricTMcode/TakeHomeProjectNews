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
            List(viewModel.articles, rowContent: ArticleRow.init)
                .navigationTitle("Take Home Test")
                .navigationDestination(for: Article.self, destination: ArticleView.init)
        }
        .task(viewModel.loadArticles)
    }
}

#Preview {
    ArticlesListView()
}
