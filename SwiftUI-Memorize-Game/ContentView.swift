//
//  ContentView.swift
//  SwiftUI-Memorize-Game
//
//  Created by Bohdan Dovhal on 19.02.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojis = halloweenTheme
    @State var themeColor = Color.orange
    
    var body: some View {
        
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                cards
            }
            Spacer()
            themeChooser
                .font(.largeTitle)
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
        }
        .foregroundStyle(themeColor)
    }
    
    var themeChooser: some View {
        HStack(spacing: 30) {
            themeItem(icon: "ladybug.circle.fill", color: .orange, theme: halloweenTheme)
            themeItem(icon: "drop.fill", color: .blue, theme: aquaTheme)
            themeItem(icon: "globe.europe.africa.fill", color: .green, theme: earthTheme)
        }
    }
    
    func themeItem(icon: String, color: Color, theme: [String]) -> some View {
        VStack {
            Button {
                themeColor = color
                emojis = theme.shuffled()
            } label: {
                Image(systemName: icon)
                    .foregroundStyle(color)
            }
            .disabled(emojis == theme)
            Text(themeName(for: color))
                .font(.caption)
        }
        .foregroundStyle(color)
    }
    
    func themeName (for color: Color) -> String {
        switch color {
        case .orange: return "Halloween"
        case .blue: return "Aqua"
        case .green: return "Earth"
        default: return "Theme"
        }
    }
}


struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
