//
//  MemorizeGame.swift
//  SwiftUI-Memorize-Game
//
//  Created by Bohdan Dovhal on 22.02.2025.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
