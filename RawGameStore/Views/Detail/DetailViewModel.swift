//
//  DetailViewModel.swift
//  RawGameStore
//
//  Created by user227300 on 10/13/22.
//

import Foundation

class DetailViewModel: ObservableObject {
    private var repository = RawGameRepository()
    
    @Published var game: Game = Game()
    
    func fetchGame(_ id: Int) async throws {
        
        Task { @MainActor in
            do {
                game = try await repository.fetchDetailGame(id)
            } catch {
                fatalError("\(error)")
            }
        }
    }}
