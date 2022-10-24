//
//  DetailScreen.swift
//  RawGameStore
//
//  Created by user227300 on 10/13/22.
//

import SwiftUI

struct DetailScreen: View {
    @StateObject private var detailViewModel = DetailViewModel()
    var gameId: Int
    
    var game: Game {
        detailViewModel.game
    }
    
    var body: some View {
        ScrollView {
            NetworkImage(imageUrl: game.background_image)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            VStack(alignment: .leading) {
                HStack {
                    Text(game.name)
                        .font(.title)
                }

                Text("Released: \(game.released)")
                Text("Rating: \(game.rating.formatted())")

                Divider()

                if(game.description != nil){
                    Text(game.description!)
                }
                
                Divider()
                
                if(game.website != nil){
                    Text("Website: \(game.website!)")
                }
            }
            .padding()
        }
        .task {
            try? await detailViewModel.fetchGame(gameId)
        }
        .navigationTitle(game.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(gameId: 4)
    }
}
