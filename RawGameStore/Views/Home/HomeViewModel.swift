//
//  HomeViewModel.swift
//  RawGameStore
//
//  Created by user227300 on 10/10/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    private var repository = RawGameRepository()
    
    @Published var genres: [Genre] = []
    @Published private var selectedGenreId : Int = 0
    @Published var games: [Game] = []
    
    func fetchGenres() async throws {
        Task { @MainActor in
            do {
                genres = try await repository.fetchGenres()
                
                if(!genres.isEmpty){
                    setGenreId(genres.first?.id ?? 0)
                }
            } catch {
                fatalError("\(error)")
            }
        }
    }

    
    func setGenreId(_ id: Int) {
        selectedGenreId = id
        Task {
            try? await fetchGames()
        }
    }
    
    
    private func fetchGames() async throws {
        Task { @MainActor in
            do {
                games = try await repository.fetchGames(selectedGenreId)
            } catch {
                fatalError("\(error)")
            }
        }
    }
}
