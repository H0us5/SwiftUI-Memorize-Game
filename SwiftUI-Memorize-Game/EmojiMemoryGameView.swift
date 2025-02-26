//
//  EmojiMemoryGameView.swift
//  SwiftUI-Memorize-Game
//
//  Created by Bohdan Dovhal on 19.02.2025.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    var viewModel: EmojiMemoryGame
    
    @State var emojis = halloweenTheme
    @State var themeColor = Color.orange
    
    var body: some View {
        VStack {
            HStack {
                title
                Spacer()
                Button("Shuffle") {
                    viewModel.shuffle()
                }
            }
            ScrollView {
                cards
            }
            Spacer()
            themeChooser
        }
        .padding()
    }
    
    var title: some View {
        Text("Memorize!")
            .font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: setCardWidth(viewModel.cards.count)), spacing: 0)]) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundStyle(themeColor)
    }
    
    var themeChooser: some View {
        HStack(spacing: 30) {
            setThemeItem(icon: "ladybug.circle.fill", color: .orange, theme: halloweenTheme)
            setThemeItem(icon: "drop.fill", color: .blue, theme: aquaTheme)
            setThemeItem(icon: "globe.europe.africa.fill", color: .green, theme: earthTheme)
        }
        
    }
    
    func setCardWidth(_ count: Int) -> CGFloat {
        switch count {
        case 24...48: return 65;
        case 12...23: return 80;
        case 4...11: return 85;
        default: return 100;
        }
    }
    
    func setThemeItem(icon: String, color: Color, theme: [String]) -> some View {
        VStack {
            Button {
                themeColor = color
                emojis = theme.shuffled()
            } label: {
                Image(systemName: icon)
                    .foregroundStyle(color)
            }
            .disabled(emojis == theme)
            Text(setThemeName(for: color))
                .font(.caption)
        }
        .foregroundStyle(color)
        .font(.largeTitle)
    }
    
    func setThemeName (for color: Color) -> String {
        switch color {
        case .orange: return "Halloween"
        case .blue: return "Aqua"
        case .green: return "Earth"
        default: return "Theme"
        }
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content).font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
