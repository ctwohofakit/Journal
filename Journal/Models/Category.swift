//
//  Category.swift
//  Journal
//
//  Created by Kit Sito on 5/31/26.
//

enum Category:String, CaseIterable, Hashable, Codable{
    case gratitude = "Gratitude"
    case goal = "Goal"
    case health = "Health"
    case fitness = "Fitness"
    case travel = "Travel"
    
    case unknown = "Unknown"
}
