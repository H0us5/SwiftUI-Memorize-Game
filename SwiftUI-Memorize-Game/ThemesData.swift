//
//  ThemesData.swift
//  SwiftUI-Memorize-Game
//
//  Created by Bohdan Dovhal on 20.02.2025.
//

import Foundation
import SwiftUI

let halloweenTheme = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙🏻‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]

let aquaTheme = ["🐠", "🐟", "🐙", "🐚", "🐦", "🦅", "🦆", "🦉"]

let earthTheme = ["🌴", "🌳", "🎋", "🌲", "🌱", "🗻", "🌍"]

struct Themes {
    struct Theme {
        let emojis: [String]
        let color: Color
    }
    
    static var themes = [
        Theme(emojis: halloweenTheme, color: .orange),
        Theme(emojis: aquaTheme, color: .blue),
        Theme(emojis: earthTheme, color: .green)
    ]
    
    static var chosenTheme: (emojis: [String], color: Color) {
        guard let randomTheme = themes.randomElement() else {
            return ([], .gray)
        }
        return (randomTheme.emojis.shuffled(), randomTheme.color)
    }
    
    static func addTheme(emojis: [String], color: Color) {
        themes.append(Theme(emojis: emojis, color: color))
    }
}
