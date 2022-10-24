//
//  GamesResponses.swift
//  RawGameStore
//
//  Created by user227300 on 10/10/22.
//

import Foundation

struct GamesResponse: Codable {
    var count: Int = 0
    var next: String? = nil
    var prev: String? = nil
    var results: [Game] = [Game()]
}

struct Game: Codable, Hashable, Identifiable {
    var id: Int = 0
    var name: String = "Game Name"
    var slug: String = "slug-name"
    var released: String = "2022-10-01"
    var background_image: String? = "https://media.rawg.io/media/games/bc0/bc06a29ceac58652b684deefe7d56099.jpg"
    var rating: Double = 4.5
    var description: String? = nil
    var website: String? = nil
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case slug
        case released
        case background_image
        case rating
        case description
        case website
    }
    
    
}
