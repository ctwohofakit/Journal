//
//  Category.swift
//  Journal
//
//  Created by Kit Sito on 5/31/26.
//
/*All / Work / Personal / School)*/
import SwiftUI

enum Category:String, CaseIterable, Hashable, Codable{
    case work = "Work"
    case personal = "Personal"
    case school = "School"
    case unknown = "Unknown"
    
    var color: Color {
        switch self {
        case .work: return .yellow
        case .personal: return .purple
        case .school: return .blue
        case .unknown: return .green
        }
    }
}
