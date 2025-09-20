//
//  Article.swift
//  TakeHomeTest
//
//  Created by Eric on 20/09/2025.
//

import Foundation

struct Article: Codable, Hashable, Identifiable {
    let id: String
    var title: String
    var text: String
}
