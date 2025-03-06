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
        let name: String
    }
    
    static var themes = [
        Theme(emojis: halloweenTheme, color: .orange, name: "Halloween"),
        Theme(emojis: aquaTheme, color: .blue, name: "Aqua"),
        Theme(emojis: earthTheme, color: .green, name: "Earth")
    ]
    
    static var chosenTheme: (emojis: [String], color: Color, name: String) {
        guard let randomTheme = themes.randomElement() else {
            return ([], .gray, "Gray")
        }
        return (randomTheme.emojis.shuffled(), randomTheme.color, randomTheme.name)
    }
    
    static func addTheme(emojis: [String], color: Color, name: String) {
        themes.append(Theme(emojis: emojis, color: color, name: name))
    }
}
