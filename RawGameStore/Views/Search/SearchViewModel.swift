//
//  SearchViewModel.swift
//  RawGameStore
//
//  Created by user227300 on 10/10/22.
//

import Foundation

class SearchViewModel: ObservableObject {
    private var repository = RawGameRepository()
    
    @Published var query: String = ""
    @Published var results: [Game] = []
    
    func searchGame() {
        Task {
            try? await fetchGames(query)
        }
    }    
    
    private func fetchGames(_ query: String) async throws {
        
        Task { @MainActor in
            do {
                results = try await repository.searchGames(query)
            } catch {
                fatalError("\(error)")
            }
        }
    }
}
