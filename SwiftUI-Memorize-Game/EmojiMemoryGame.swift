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
    var themeColor = Color.orange
    
    init() {
        updateTheme()
    }
    
    private func updateTheme() {
        let currentTheme = Themes.chosenTheme
        themeColor = currentTheme.color
        EmojiMemoryGame.emojis = currentTheme.emojis
    }
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: Int.random(in: 2...emojis.count)) {  pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            }
            return "⁉️"
        }
    }
    
    private var model = createMemoryGame()
    
    func startGame() {
        updateTheme()
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intense
    
    func shuffle() {
        model.shuffle()
    }
    
    func giveScore() -> Int{
        let score = model.showScore()
        return score
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
