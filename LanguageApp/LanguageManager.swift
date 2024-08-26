//
//  LanguageManager.swift
//  LanguageApp
//
//  Created by Merve Sena on 14.08.2024.
//

import Foundation
import SwiftUI

class LanguageManager: ObservableObject {
    @AppStorage("selectedLanguage") var selectedLanguage: String = Locale.current.languageCode ?? "en" {
        didSet {
            updateLanguage()
        }
    }

    @Published var locale: Locale = Locale.current
    
    init() {
        updateLanguage()
    }

    func updateLanguage() {
        // Determine selected language code
        let languageCode = languageCodeForLanguage(selectedLanguage)
        
        // Update in-app language
        locale = Locale(identifier: languageCode)
        
        //Update iOS default language setting (Apple Languages)
        UserDefaults.standard.set([languageCode], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
    }

    private func languageCodeForLanguage(_ language: String) -> String {
        switch language {
        case "en":
            return "en"
        case "tr":
            return "tr"
        case "de":
            return "de"
        case "fr":
            return "fr"
        default:
            return "en"  // Default language
        }
    }
}






