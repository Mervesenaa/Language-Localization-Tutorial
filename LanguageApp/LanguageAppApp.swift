//
//  LanguageAppApp.swift
//  LanguageApp
//
//  Created by Merve Sena on 14.08.2024.
//

import SwiftUI

@main
struct LanguageAppApp: App {
    @StateObject private var languageManager = LanguageManager()
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true

    var body: some Scene {
        WindowGroup {
            if isFirstLaunch {
                LanguageCurrencySelectionView().environmentObject(languageManager)
            } else {
                ContentView()
                    .environmentObject(languageManager)
            }
        }
    }
}

