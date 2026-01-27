//
//  ArticleView.swift
//  TakeHomeTest
//
//  Created by Eric on 27/01/2026.
//

import SwiftUI

struct ArticleView: View {
    var article: Article

    var body: some View {
        ScrollView {
            Text(article.text)
        }
    }
}

#Preview {
    ArticleView(article: .example)
}
