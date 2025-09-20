//
//  ArticleRow.swift
//  TakeHomeTest
//
//  Created by Eric on 20/09/2025.
//

import SwiftUI

struct ArticleRow: View {
    var article: Article

    var body: some View {
        NavigationLink(value: article) {
            HStack {
                ArticleImage(imageURL: article.thumbnail)
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
}

#Preview {
    ArticleRow(article: .example)
}
