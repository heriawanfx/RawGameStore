//
//  GameItem.swift
//  RawGameStore
//
//  Created by user227300 on 10/10/22.
//

import SwiftUI

struct GameItem: View {
    var game: Game
    
    var body: some View {
            
        HStack() {
            NetworkImage(imageUrl: game.background_image).frame(width: 80, height: 80)
            VStack(alignment: .leading){
                Text(game.name)
                    .font(.headline)
                    .lineLimit(1)
                Text("Released: \(game.released)")
                Text("Rating: \(game.rating.formatted())")
            }
        }
        
    }
    
}

struct GameItem_Previews: PreviewProvider {
    static var previews: some View {
        GameItem(game: Game())
        
    }
}
