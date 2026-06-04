//
//  JournalEntry.swift
//  Journal
//
//  Created by Kit Sito on 5/30/26.
//

import Foundation
import SwiftData

//Title, date, favorite button(bool)  journal///
//<Nav title> button navigation—back(“journal”), “Edit” 

//why use class??
@Model // used to auto assinged id , no need id field anymore


class JournalEntry {
    
    var title: String
    var body: String
    var dateCreated: Date
    var isFavorite: Bool
    var category: Category
    
    init(title: String, body: String, dateCreated: Date = .now, isFavorite: Bool = false, category: Category = .unknown) {
      
        self.title = title
        self.body = body
        self.dateCreated = dateCreated
        self.isFavorite = isFavorite
        self.category = category
        
    }
    
    
}
