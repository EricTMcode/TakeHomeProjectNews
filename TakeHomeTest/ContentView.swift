//
//  ContentView.swift
//  TakeHomeTest
//
//  Created by Eric on 10/07/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var articles = [Article]()

    var body: some View {
        NavigationStack {
            List(articles) { article in
                NavigationLink(article.title, value: article)
            }
            .navigationDestination(for: Article.self) { article in
                Text(article.text)
            }
        }
        .task(loadArticles)
    }

    func loadArticles() async {
        do {
            let url = URL(string: "https://hws.dev/news")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            articles = try decoder.decode([Article].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
