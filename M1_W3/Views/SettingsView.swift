//
//  SettingsView.swift
//  M1_W2
//
//  Created by Tahani Ayman on 15/09/1446 AH.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var birthday: Date = Date()
    @State private var isDarkMode = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("About the application")){
                    StaticRowView(icon: "gear", firstText: "Application", secondText: "News")
                    StaticRowView(icon: "keyboard", firstText: "Developer", secondText: "Tahani")
                    StaticRowView(icon: "flag", firstText: "Version", secondText: "1.0.0")
                        
                }
                
                Section(header: Text("Actions")){
                    // Toggle switch to enable or disable dark mode
                    Toggle("Enable Dark Mode", isOn: $isDarkMode)
                        
                }
            }
            .accentColor(Color("Color"))
            .navigationTitle("Settings")
        }
        // Applies the selected color scheme (light or dark mode)
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

