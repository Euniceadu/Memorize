//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Eunice Obugyei on 03/01/2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static var emoji_indexes = Array<Int>()
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        let emojis = theme.emojis
        EmojiMemoryGame.emoji_indexes = Array(0..<emojis.count)
//        required task 5
        return MemoryGame<String>(numberOfPairsOfCards: 10) {
            pairIndex in emojis[getRandomEmoji()]
        }
    }
    
    static func createThemes() -> Array<Theme> {
        var all_themes = Array<Theme>()
        let vehicle_theme = Theme(name: "Vehicles", emojis: ["🚗", "🚲", "✈️", "⛵️", "🛳", "🚡", "🛴", "🚑", "🚍", "🚢", "🛩", "🚁", "🚎", "🚜", "🛶", "🚕", "🚙", "🚒", "🏎", "🚆", "🛵", "🏍", "🛻", "🚛"], numberOfPairsOfCards: 10, color: "Yellow")
        all_themes.append(vehicle_theme)
        let animals_theme = Theme(name: "Animals", emojis: ["🐝", "🦀", "🦋", "🐬", "🐴", "🦄", "🐧", "🐸", "🐼", "🐶", "🐒", "🐦", "🐓", "🦜", "🐋", "🦖", "🦆", "🦅", "🐿", "🦚", "🦈", "🦎", "🐨", "🦊"], numberOfPairsOfCards: 7, color: "Blue")
        all_themes.append(animals_theme)
        let activities_theme = Theme(name: "Activities", emojis: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸", "🏏", "🥊", "⛳️", "🏑", "🪁", "⛸", "🤿", "🥍", "🥅", "⛷", "🏂"], numberOfPairsOfCards: 10, color: "Green")
        all_themes.append(activities_theme)
        
        return all_themes
    }
    
    static func getColor(name: String) -> Color {
        switch(name.lowercased()) {
        case "yellow":
            return .yellow
        case "blue":
            return .blue
        case "green":
            return .green
        default:
                return .red
        }
    }
    
    static func getRandomEmoji() -> Int {
        let emoji_index = EmojiMemoryGame.emoji_indexes.randomElement()!
        EmojiMemoryGame.emoji_indexes.remove(at: EmojiMemoryGame.emoji_indexes.firstIndex(of: emoji_index)!)
        return emoji_index
    }
    
    private var themes: Array<Theme> = createThemes()
    var selectedTheme: Theme
    var color: Color
    @Published private var model: MemoryGame<String>
    
    
    init() {
        selectedTheme = themes.randomElement()!
        model  = EmojiMemoryGame.createMemoryGame(theme: selectedTheme)
        color = EmojiMemoryGame.getColor(name: selectedTheme.color)
    }
        
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
//    MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func startNewGame() {
        selectedTheme = themes.randomElement()!
        color = EmojiMemoryGame.getColor(name: selectedTheme.color)
        model  = EmojiMemoryGame.createMemoryGame(theme: selectedTheme)
    }
}
