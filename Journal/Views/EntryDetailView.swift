//
//  EntryDetailView.swift
//  Journal
//
//  Created by Kit Sito on 5/31/26.
//

import SwiftUI
import SwiftData

struct EntryDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    let entry: JournalEntry
    @State private var showEdit: Bool = false

        
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 16){
                HStack(alignment: .top){
                    VStack(alignment: .leading, spacing: 8){
                        Text(entry.title)
                        
                        Text(entry.dateCreated.formatted(date: .long, time: .shortened))
                    }
                    Spacer()
                    
                    Button{
                        entry.isFavorite.toggle()
                    } label: {
                        Image(systemName: entry.isFavorite ? "heart.fill" : "heart")
                    }
                    
                   
                    
                }//HStack end
                Divider()
                ColoredCapsule(text: entry.category.rawValue, color: entry.category.color)
             
                Divider()

                
                Text(entry.body)
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }//VStack end
            .padding()
        }//scroll view end
        .navigationTitle("Journal Entry")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing){
                Button("Edit"){
                    showEdit = true
                }
            }
            ToolbarItem(placement: .topBarTrailing){
                Button(role: .destructive){
                    context.delete(entry)
                    dismiss()
                } label: {
                    Label("Delete" , systemImage: "trash")
                }
            }
        }
        .sheet(isPresented: $showEdit){
            NavigationStack{
                EntryFormView(entry: entry, category: .unknown)
            }
        }
               
               
    
        
        
    }
}


#Preview{
    
}
