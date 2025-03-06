//
//  MemorizeGame.swift
//  SwiftUI-Memorize-Game
//
//  Created by Bohdan Dovhal on 22.02.2025.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    private(set) var score = 0
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
        cards.shuffle()
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue)} }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                        addScore()
                    } else {
                        if cards[chosenIndex].seenBefore && cards[potentialMatchIndex].seenBefore {
                            subtractScore()
                        }
                        cards[potentialMatchIndex].seenBefore = true
                    }
                    cards[chosenIndex].isFaceUp = true
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                    
                }
                cards[chosenIndex].seenBefore = true
                
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    func showScore() -> Int {
        return score
    }
    
    mutating func addScore() {
        score += 2
    }
    mutating func subtractScore() {
        score -= 1
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        var seenBefore = false
        
        var id: String
        var debugDescription: String {
            return "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : "")"
        }
        
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
