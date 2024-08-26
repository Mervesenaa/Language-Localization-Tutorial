//
//  ContentView.swift
//  LanguageApp
//
//  Created by Merve Sena on 14.08.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @AppStorage("selectedCurrency") private var selectedCurrency: String = "USD"

    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                Text(LocalizedStringKey("Welcome to the App!"))
                    .font(.title2)
                    .fontWeight(.light)
                    .foregroundStyle(Color(red: 0/255, green:71/255, blue:171/255))
                    .padding(.top, 50)

                VStack(spacing: 20) {
                    HStack {
                        Text(LocalizedStringKey("Current Currency"))
                            .font(.headline)
                            .foregroundStyle(Color(red: 0/255, green:71/255, blue:171/255)).opacity(0.7)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(currencyDisplay(for: selectedCurrency))
                            .font(.body)
                            .foregroundStyle(Color.black)
                            .padding(10)
                            .frame(width: 150)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                }

                Spacer()

                NavigationLink(destination: SettingsView()) {
                    Text(LocalizedStringKey("Go to Settings"))
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
            .environment(\.locale, languageManager.locale) // Required for instant language change
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.green.opacity(0.3)]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
    
    private func currencyDisplay(for currencyCode: String) -> String {
        switch currencyCode {
        case "USD":
            return "$ - USD"
        case "EUR":
            return "€ - EUR"
        case "TRY":
            return "₺ - TRY"
        case "GBP":
            return "£ - GBP"
        default:
            return currencyCode
        }
    }
}

#Preview {
    ContentView().environmentObject(LanguageManager())
}
