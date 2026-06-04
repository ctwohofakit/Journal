//
//  EntryRowView.swift
//  Journal
//
//  Created by Kit Sito on 5/31/26.
//

import SwiftUI
import SwiftData

struct EntryRowView: View {
    let entry: JournalEntry

    @AppStorage(SETTINGS_TITLE_SIZE) private var titleSize: TitleSize = SETTINGS_TITLE_SIZE_VALUE
    let showCategory: Bool

    var fontHead: Font{
        switch(titleSize){
        case .small : return .headline
        case .medium : return .title2
        case .big : return .title
 
        }
    }
    
    
    var body: some View {
        VStack{
            HStack(spacing: 10) {
                Text(entry.title)
                    .font(fontHead)
                    .lineLimit(1)
                if entry.isFavorite {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.blue)
                }
                
            }
            if showCategory {
                ColoredCapsule(text: entry.category.rawValue, color: entry.category.color)

            }

            Text(entry.dateCreated, style: .date)
                .font(.footnote)
        }
        
    }
}
#Preview {
    EntryRowView(
        entry: JournalEntry(
            title: "My First Journal",
            body: "Today was a great day.",
            category: .personal
        ),
        showCategory: true
    )}
