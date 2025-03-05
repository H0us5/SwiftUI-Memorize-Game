//
//  EmojiMemoryGameView.swift
//  SwiftUI-Memorize-Game
//
//  Created by Bohdan Dovhal on 19.02.2025.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack {
                title
                Spacer()
                scoreLabel
            }
            ScrollView {
                cards
                    .animation(.default, value: viewModel.cards)
            }
            Spacer()
            newGameButton
        }
        .padding()
    }
    
    var title: some View {
        Text("Memorize!")
            .font(.largeTitle)
    }
    
    var newGameButton: some View {
        Button("New Game") {
            viewModel.startGame()
        }
    }
    
    var scoreLabel: some View {
        Text("Score: \(viewModel.score)")
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: setCardWidth(viewModel.cards.count)), spacing: 0)]) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundStyle(viewModel.themeColor)
    }
    

    
    func setCardWidth(_ count: Int) -> CGFloat {
        switch count {
        case 24...48: return 65;
        case 12...23: return 80;
        case 4...11: return 85;
        default: return 100;
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
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
