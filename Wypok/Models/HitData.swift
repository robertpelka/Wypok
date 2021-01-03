//
//  HitData.swift
//  Wypok
//
//  Created by Robert Pelka on 02/01/2021.
//

import Foundation

struct Hits: Decodable {
    let data: [Hit]
}

struct Hit: Decodable, Identifiable {
    let id: Int
    let title: String
    let source_url: String
    let vote_count: Int
    let preview: String?
}
