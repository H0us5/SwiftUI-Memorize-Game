//
//  SwiftUI_Memorize_GameApp.swift
//  SwiftUI-Memorize-Game
//
//  Created by Bohdan Dovhal on 19.02.2025.
//

import SwiftUI

@main
struct SwiftUI_Memorize_GameApp: App {
    var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
