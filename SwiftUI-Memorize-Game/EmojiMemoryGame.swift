//
//  EmojiMemoryGame.swift
//  SwiftUI-Memorize-Game
//
//  Created by Bohdan Dovhal on 22.02.2025.
//

import SwiftUI
import Observation

@Observable class EmojiMemoryGame  {
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙🏻‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 6) {  pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            }
                return "⁉️"
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intence
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
