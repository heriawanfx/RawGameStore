//
//  SearchScreen.swift
//  RawGameStore
//
//  Created by user227300 on 10/13/22.
//

import SwiftUI

struct SearchScreen: View {
    @StateObject private var searchViewModel = SearchViewModel()
    
    var gameResults: [Game] {
        searchViewModel.results
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search", text: $searchViewModel.query)
                    Button("Find", action: {
                        searchViewModel.searchGame()
                    })
                }
                .padding()
                GameList(gameList: gameResults)
            }
            .navigationTitle("Search")
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
