//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Eunice Obugyei on 15/09/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
