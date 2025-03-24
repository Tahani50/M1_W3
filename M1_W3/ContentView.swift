//
//  ContentView.swift
//  M1_W3
//
//  Created by Taibah Valley Academy on 3/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NewsListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .accentColor(Color("Color"))
    }
}

#Preview {
    ContentView()
}
