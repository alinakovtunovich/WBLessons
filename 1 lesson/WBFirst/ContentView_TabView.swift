//
//  ContentView_TabView.swift
//  WBFirst
//
//  Created by Ayrmidon Hagraven on 6/5/24.
//

import SwiftUI

enum Tabs: Hashable {
    case heart
    case broke
    case game
}

struct ContentView_TabView: View {
    
    @State var selectedTab: Tabs = .heart
    
    var body: some View {
        TabView(selection: $selectedTab, content: {
            HeartScreen().tabItem {
                Label("Heart", systemImage: "heart")
            }.tag(Tabs.heart)
            GameScreen().tabItem {
                Label("Game", systemImage: "gamecontroller")
            }.tag(Tabs.game)
            BrokenHeartScreen().tabItem {
                Label("Broken", systemImage: "heart.slash")
            }.tag(Tabs.broke)
        })
    }
}

struct ContentView_TabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_TabView()
    }
}
