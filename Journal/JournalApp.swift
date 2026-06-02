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
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                EntryListView()
            }
        }//window
        .modelContainer(for: JournalEntry.self)
    }
}

