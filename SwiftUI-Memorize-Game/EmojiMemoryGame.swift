//
//  EmojiMemoryGame.swift
//  SwiftUI-Memorize-Game
//
//  Created by Bohdan Dovhal on 22.02.2025.
//

import SwiftUI
import Observation

@Observable class EmojiMemoryGame  {
    private static var emojis = halloweenTheme
    var theme = "halloween"
    
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
    
    // MARK: - Intense
    
    func shuffle() {
        model.shuffle()
    }
    
    func changeTheme(newTheme: String) {
        theme = newTheme
        switch newTheme {
            case "halloween":
            EmojiMemoryGame.emojis = halloweenTheme
        case "aqua":
            EmojiMemoryGame.emojis = aquaTheme
        case "earth":
            EmojiMemoryGame.emojis = earthTheme
        default:
            EmojiMemoryGame.emojis = halloweenTheme
        }
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
