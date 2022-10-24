//
//  HomeScreen.swift
//  RawGameStore
//
//  Created by user227300 on 10/10/22.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var homeViewModel = HomeViewModel()
    
    var genreList: [Genre] {
        homeViewModel.genres
    }
    
    var gameList: [Game] {
        homeViewModel.games
    }
    
    var body: some View {
        NavigationView {
            VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(){
                    ForEach(genreList) { genre in
                        Button(action: {
                            homeViewModel.setGenreId(genre.id)
                        }) {
                            Text(genre.name)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(25)
                            
                        }
                    }
                }.padding()
            }
            if(genreList.isEmpty || gameList.isEmpty){
                ProgressView()
            }
            GameList(gameList: gameList)
            }
            .navigationTitle("Home")
            .task {
                try? await homeViewModel.fetchGenres()
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
