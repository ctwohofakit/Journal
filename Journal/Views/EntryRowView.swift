//
//  EntryRowView.swift
//  Journal
//
//  Created by Kit Sito on 5/31/26.
//

import SwiftUI

struct EntryRowView: View {
    let entry: JournalEntry
    var body: some View {
        VStack{
            HStack(spacing: 10) {
                Text(entry.title)
                    .font(.headline)
                    .lineLimit(1)
                if entry.isFavorite {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.blue)
                }
                
            }
            Text(entry.dateCreated, style: .date)
                .font(.footnote)
        }
        Spacer()
        
    }
}
