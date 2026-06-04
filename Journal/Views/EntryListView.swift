//
//  EntryListView.swift
//  Journal
//
//  Created by Kit Sito on 5/30/26.
//
import SwiftData
import SwiftUI

struct EntryListView: View {
    //call for storage
    @Environment(\.modelContext) private var context
    @Query(sort: \JournalEntry.dateCreated, order: .reverse) private var entries: [JournalEntry]
    
    @State private var searchText: String = ""
    @State private var showFavoriteOnly: Bool = false
    @State private var sortNewestFirst: Bool = true
    @AppStorage(SETTINGS_SHOW_CATEGORY) private var showCategory: Bool = SETTINGS_SHOW_CATEGORY_VALUE

    @State private var selectedCategory: Category? = nil
    
    
    private var filteredEntries: [JournalEntry] {
        var result = showFavoriteOnly ? entries.filter{ $0.isFavorite } : entries
        if let category = selectedCategory {
            result = result.filter{ entry in
                entry.category == category
            }
        }
        let s = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        if !s.isEmpty {
            result = result.filter {
                $0.title.localizedCaseInsensitiveContains(s) || $0.body.localizedCaseInsensitiveContains(s)
            }
        }
        result.sort{ a, b in
            sortNewestFirst ? (a.dateCreated > b.dateCreated) : (a.dateCreated < b.dateCreated)
        }
        
        return result
        
    }
 
    
    var body: some View {
//        TabView{
            HStack{
                Button("All"){selectedCategory = nil}
                    .foregroundColor(.white)
                    .padding(5)
                    .background(.blue)

                    
                Button("Work"){selectedCategory = .work}
                    .foregroundColor(.white)
                    .padding(5)
                    .background(.blue)

                Button("Scool"){selectedCategory = .school}
                    .foregroundColor(.white)
                    .padding(5)
                    .background(.blue)

                Button("Personal"){selectedCategory = .personal}
                    .foregroundColor(.white)
                    .padding(5)
                    .background(.blue)

                Button("Unknown"){selectedCategory = .unknown}
                    .foregroundColor(.white)
                    .padding(5)
                    .background(.blue)

            }
            .frame(maxWidth: 400, maxHeight: 50)
    
        List{
            if filteredEntries.isEmpty {
                //ContentUnavaliableView
                ContentUnavailableView("No entries yet..", systemImage: "book.closed", description: Text("Tap + to add your first entry."))
            }else {
                ForEach(filteredEntries){ entry in
                    NavigationLink{
                        EntryDetailView(entry: entry)
                    } label: {
                        EntryRowView(entry: entry, showCategory: showCategory)
                    }
                }.onDelete(perform: deleteRows)
            }
            
        }
        .navigationTitle("Journal")
        .searchable(text: $searchText, prompt: "Search keywords title or body")
        .toolbar {
            ToolbarItem(placement: .topBarLeading){
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing){
                NavigationLink{
                    EntryFormView(entry: nil, category: .unknown)//create from empty
                } label: {
                    Image(systemName: "plus")
                }
            }
            
            ToolbarItem(placement: .topBarTrailing){
                Menu{
                    NavigationLink{
                        SettingsView()
                    } label: {
                        HStack{
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                    }
                    Toggle(isOn: $showFavoriteOnly) {
                        Label("Favorite Only", systemImage: "heart.fill")
                    }
                    Divider()
                    
                    Picker("Sort by:", selection: $sortNewestFirst){
                        Text("Newest first").tag(true)
                        Text("Oldest first").tag(false)
                    }
                    
                }
                label: {
                    Image(systemName: "line.3.horizontal")
                }
                
            }
            
        }
        
//            .tabItem {
//                Label("Home", systemImage: "house")
//            }
//            SettingsView()
//            .tabItem {
//                Label("Settings", systemImage: "gear")
//            }

//        }
         
    }
    
    private func deleteRows(at offsets: IndexSet){
        for i in offsets {
            context.delete(filteredEntries[i])
        }
    }
    
}











#Preview {
    NavigationStack{
    EntryListView(
    )
    }
}
