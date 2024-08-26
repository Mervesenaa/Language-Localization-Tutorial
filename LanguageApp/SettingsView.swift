//
//  SettingsView.swift
//  LanguageApp
//
//  Created by Merve Sena on 14.08.2024.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("selectedLanguage") private var selectedLanguage = "en"
    @AppStorage("selectedCurrency") private var selectedCurrency = "USD"
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        VStack(spacing: 40) {
            Text(LocalizedStringKey("Settings"))
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0/255, green: 71/255, blue: 171/255))
                .padding(.top, 60)

            ScrollView {
                VStack(spacing: 30) {
                    HStack {
                        Text(LocalizedStringKey("Language"))
                            .font(.headline)
                            .foregroundColor(Color(red: 0/255, green: 71/255, blue: 171/255)).opacity(0.8)
                            .fontWeight(.semibold)
                        
                        Spacer()

                        Picker(LocalizedStringKey("Language"), selection: $selectedLanguage) {
                            Text("English").tag("en")
                            Text("Türkçe").tag("tr")
                            Text("Deutsch").tag("de")
                            Text("Français").tag("fr")
                        }
                        .pickerStyle(MenuPickerStyle())
                        .padding(.vertical, 8)
                        .padding(.horizontal, 15)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 4)
                        .frame(width: 150)
                    }
                    .padding(.horizontal, 20)
                    .onChange(of: selectedLanguage) { newLanguage in
                        languageManager.updateLanguage()
                    }

                    HStack {
                        Text(LocalizedStringKey("Currency"))
                            .font(.headline)
                            .foregroundColor(Color(red: 0/255, green: 71/255, blue: 171/255)).opacity(0.8)
                            .fontWeight(.semibold)
                        
                        Spacer()

                        Picker(LocalizedStringKey("Currency"), selection: $selectedCurrency) {
                            Text("$ - USD").tag("USD")
                            Text("€ - EUR").tag("EUR")
                            Text("₺ - TRY").tag("TRY")
                            Text("£ - GBP").tag("GBP")
                        }
                        .pickerStyle(MenuPickerStyle())
                        .padding(.vertical, 8)
                        .padding(.horizontal, 15)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 4)
                        .frame(width: 150)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .padding(.top, 20)
        }
        .environment(\.locale, languageManager.locale)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.green.opacity(0.3)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

#Preview {
    SettingsView().environmentObject(LanguageManager())
}


