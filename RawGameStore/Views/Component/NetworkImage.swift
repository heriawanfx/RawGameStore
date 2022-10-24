//
//  NetworkImage.swift
//  RawGameStore
//
//  Created by user227300 on 10/10/22.
//

import SwiftUI

struct NetworkImage: View {
    var imageUrl: String?
    
    var body: some View {
        if imageUrl == nil {
            VStack {
                Image("#555555")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 100)
                Text("Error happen")
                    .font(.title2)
                Text("Please try again.")
                    .font(.title3)
            }
        } else {
            AsyncImage(url: URL(string: imageUrl!)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                }  else if phase.error != nil  {
                    VStack {
                        Image("#555555")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 300)
                        Text("Error happen")
                            .font(.title2)
                        Text("Please try again.")
                            .font(.title3)
                    }
                    
                } else {
                    ProgressView()
                }
            }
        }
    }
}

struct NetworkImage_Previews: PreviewProvider {
    static var previews: some View {
        NetworkImage(imageUrl: "https://media.rawg.io/media/games/bc0/bc06a29ceac58652b684deefe7d56099.jpg")
    }
}
