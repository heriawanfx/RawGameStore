//
//  RawGameRepository.swift
//  RawGameStore
//
//  Created by user227300 on 10/11/22.
//

import Foundation

class RawGameRepository {
    
    var jsonDecoder: JSONDecoder = JSONDecoder()
    
    func fetchGenres() async throws -> [Genre] {
        var urlComponents = URLComponents(string: "\(BASE_URL_API)\(PATH_GENRES)")
        urlComponents?.queryItems = [
            URLQueryItem(name: "key", value: "\(API_KEY)"),
        ]
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: urlComponents!.url!))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Cannot fetch genres")
        }
                
        let responseDto = try jsonDecoder.decode(GenresResponse.self, from: data)
        
        return responseDto.results
 
    }
    
    func fetchGames(_ genreId: Int) async throws -> [Game] {
        var urlComponents = URLComponents(string: "\(BASE_URL_API)\(PATH_GAMES)")
        urlComponents?.queryItems = [
            URLQueryItem(name: "key", value: "\(API_KEY)"),
            URLQueryItem(name: "platforms", value: "3"),
            URLQueryItem(name: "stores", value: "4"),
            URLQueryItem(name: "genres", value: String(genreId)),
        ]
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: urlComponents!.url!))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Cannot fetch games")
        }
                
        let responseDto = try jsonDecoder.decode(GamesResponse.self, from: data)
        
        return responseDto.results
 
    }
    
    func fetchDetailGame(_ gameId: Int) async throws -> Game {
        var urlComponents = URLComponents(string: "\(BASE_URL_API)\(PATH_GAMES)/\(gameId)")
        urlComponents?.queryItems = [
            URLQueryItem(name: "key", value: "\(API_KEY)"),
        ]
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: urlComponents!.url!))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Cannot fetch games")
        }
                
        let responseDto = try jsonDecoder.decode(Game.self, from: data)
        
        return responseDto
 
    }
    
    func searchGames(_ query: String) async throws -> [Game] {
        var urlComponents = URLComponents(string: "\(BASE_URL_API)\(PATH_GAMES)")
        urlComponents?.queryItems = [
            URLQueryItem(name: "key", value: "\(API_KEY)"),
            URLQueryItem(name: "search", value: query),
        ]
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: urlComponents!.url!))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Cannot fetch games")
        }
                
        let responseDto = try jsonDecoder.decode(GamesResponse.self, from: data)
        
        return responseDto.results
 
    }
    
}
