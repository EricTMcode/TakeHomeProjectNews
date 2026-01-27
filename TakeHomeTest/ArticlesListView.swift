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
            List(viewModel.articles) { article in
                NavigationLink(value: article) {
                    HStack {
                        AsyncImage(url: article.thumbnail) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                            default:
                                Image(systemName: "newspaper")
                            }
                        }
                        .frame(width: 80, height: 80)
                        .clipShape(.rect(cornerRadius: 10))

                        VStack(alignment: .leading) {
                            Text(article.section)
                                .font(.caption.weight(.heavy))

                            Text(article.title)
                        }
                    }
                }
            }
            .navigationTitle("Take Home Test")
            .navigationDestination(for: Article.self, destination: ArticleView.init)
        }
        .task(viewModel.loadArticles)
    }

}

#Preview {
    ArticlesListView()
}
