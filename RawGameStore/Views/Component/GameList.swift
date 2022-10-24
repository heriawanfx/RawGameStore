//
//  GameList.swift
//  RawGameStore
//
//  Created by user227300 on 10/24/22.
//

import SwiftUI



struct GameList: View {
    
    var gameList: [Game]
    
    var body: some View {
        List {
            ForEach(gameList, id: \.id){ game in
                NavigationLink(destination: {
                    DetailScreen(gameId: game.id)
                }){
                    GameItem(game: game)
                }.buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct GameList_Previews: PreviewProvider {
    static var previews: some View {
        GameList(gameList: [Game()])
    }
}
