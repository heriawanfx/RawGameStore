//
//  ContentView.swift
//  RawGameStore
//
//  Created by user227300 on 10/10/22.
//

import SwiftUI

struct ContentView: View {

    @State private var selectedTab: Tab = .home
    
    enum Tab {
        case home, search, about
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)
            SearchScreen()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(Tab.search)
            AboutScreen()
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
                .tag(Tab.about)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
