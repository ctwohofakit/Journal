//
//  SettingView.swift
//  Journal
//
//  Created by Kit Sito on 5/31/26.
//

import SwiftUI

struct SettingsView: View {
    //dark mode
    @AppStorage(SETTINGS_THEME) private var theme: Theme = .system

    
    //bigger font
    @AppStorage(SETTINGS_TITLE_SIZE) private var titleSize: TitleSize = SETTINGS_TITLE_SIZE_VALUE

    

    @AppStorage(SETTINGS_SHOW_CATEGORY) private var showCategory: Bool = SETTINGS_SHOW_CATEGORY_VALUE

    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Appearance")){
                    Picker("Theme", selection: $theme){
                        ForEach(Theme.allCases, id: \.self) {theme in
                            Text(theme.rawValue).tag(theme)
                        }
                    }
                    
                    Picker("Title Size", selection: $titleSize){
                        ForEach(TitleSize.allCases, id: \.self) { size in
                            Text(size.rawValue).tag(size)
                        }
                    }
                    
                    
                    //
                 
                }
                Section(header: Text("Category Labels")){
                    Toggle(isOn: $showCategory){
                        Text("Show category")
                    }
                }
                
            }
        }
        .navigationBarTitle("Settings")

        
    }
    
}
