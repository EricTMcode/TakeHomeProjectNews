//
//  Article.swift
//  TakeHomeTest
//
//  Created by Eric on 27/01/2026.
//

import Foundation

struct Article: Codable, Hashable, Identifiable {
    let id: String
    var title: String
    var text: String

    static let example = Article(
        id: "1",
        title: "Apple buys Hacking with Swift",
        text: "In a move that shocked everyone, especially Tim Cook and Paul Hudson, Apple bought hackingwithswift.com."
    )
}
