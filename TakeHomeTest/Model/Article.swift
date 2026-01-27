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
}
