//
//  AboutScreen.swift
//  RawGameStore
//
//  Created by user227300 on 10/13/22.
//

import SwiftUI

struct AboutScreen: View {    
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                Text("This app built with SwiftUI to fullfill project submission at Dicoding")
                    .multilineTextAlignment(.center)
                
                Text("by")
                    .padding(.all)
                
                NetworkImage(imageUrl: AVATAR_URL)
                    .cornerRadius(25)
                    .frame(width: 50, height: 50)
                Text("Heri Setiawan")
            }
            .padding()
            .navigationTitle("About")
        }
        
    }
}

struct AboutScreen_Previews: PreviewProvider {
    static var previews: some View {
        AboutScreen()
    }
}
