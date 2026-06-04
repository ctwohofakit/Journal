//
//  ColoredCapsule.swift
//  Journal
//
//  Created by Kit Sito on 6/2/26.
//

import SwiftUI

struct ColoredCapsule: View {
    var text: String
    var color: Color = .accentColor
    
    var body: some View{
        Text(text)
            .font(.caption)
            .foregroundStyle(.white)
            .fontWeight(.bold)
            .padding(12)
            .background(color.opacity(0.6))
            .clipShape(RoundedRectangle(cornerRadius:8))
    }
}
