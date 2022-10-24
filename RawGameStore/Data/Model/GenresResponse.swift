//
//  GenresResponses.swift
//  RawGameStore
//
//  Created by user227300 on 10/10/22.
//

import Foundation

struct GenresResponse: Codable {
    var count: Int = 0
    var next: String? = nil
    var prev: String? = nil
    var results: [Genre] = [Genre()]
}

struct Genre: Codable, Hashable, Identifiable {
    var id: Int = 0
    var name: String = "Genre"
    var slug: String = "genre"
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case slug
    }
}
