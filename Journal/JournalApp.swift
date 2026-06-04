//
//  JournalApp.swift
//  Journal
//
//  Created by Kit Sito on 5/30/26.
//

import SwiftUI
import SwiftData


@main
struct JournalApp: App {
    @AppStorage(SETTINGS_THEME) private var theme: Theme = .system

    var colorScheme: ColorScheme? {
        switch(theme){
            case .light: return .light
            case .dark: return .dark
            case .system: return nil
            
        }
    }
    var body: some Scene {
        WindowGroup {
            TabView{
                NavigationStack{
                    EntryListView()
                }
                
//                NavigationStack{
//                    EntryListView()
//                }
                .tabItem{
                    Label("Home", systemImage: "house")
                }
                NavigationStack{
                    SettingsView()
                }.tabItem {
                    Label("Settings", systemImage: "gear")
                }
            }
           
            .preferredColorScheme(colorScheme)

            
        }//window
        .modelContainer(for: JournalEntry.self)
    }
}

