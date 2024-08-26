//
//  LanguageCurrencySelectionView.swift
//  LanguageApp
//
//  Created by Merve Sena on 14.08.2024.
//

import SwiftUI

struct LanguageCurrencySelectionView: View {
    @AppStorage("selectedLanguage") private var selectedLanguage = "en"
    @AppStorage("selectedCurrency") private var selectedCurrency = "USD"
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        VStack(spacing: 30) {
            Text("Select Language & Currency")
                .font(.title2)
                .fontWeight(.light)
                .foregroundStyle(Color(red: 0/255, green:71/255, blue:171/255))
                .padding(.top, 40)
            
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Language")
                        .font(.headline)
                        .foregroundStyle(Color(red: 0/255, green:71/255, blue:171/255)).opacity(0.7)
                        .fontWeight(.semibold)
                    
                    Picker("Language", selection: $selectedLanguage) {
                        Text("English").tag("en")
                        Text("Türkçe").tag("tr")
                        Text("Deutsch").tag("de")
                        Text("Français").tag("fr")
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(maxWidth: .infinity)
                    .padding(12)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .onChange(of: selectedLanguage) { newLanguage in
                        languageManager.updateLanguage()
                    }
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(LocalizedStringKey("Currency"))
                        .font(.headline)
                        .foregroundStyle(Color(red: 0/255, green:71/255, blue:171/255)).opacity(0.7)
                        .fontWeight(.semibold)
                    
                    Picker("Currency", selection: $selectedCurrency) {
                        Text("$ - USD").tag("USD")
                        Text("€ - EUR").tag("EUR")
                        Text("₺ - TRY").tag("TRY")
                        Text("£ - GBP").tag("GBP")
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(maxWidth: .infinity)
                    .padding(12)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                isFirstLaunch = false
            }) {
                Text("Continue")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(.horizontal)
            .padding(.bottom, 40)
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.green.opacity(0.3)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

#Preview {
    LanguageCurrencySelectionView()
}
