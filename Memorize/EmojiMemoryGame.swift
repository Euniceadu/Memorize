//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Eunice Obugyei on 03/01/2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static var emoji_indexes = Array<Int>()
    
    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        let emojis = theme.emojis
        EmojiMemoryGame.emoji_indexes = Array(0..<emojis.count)
//        required task 5
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) {
            pairIndex in emojis[getRandomEmoji()]
        }
    }
    
    private static func createThemes() -> Array<Theme> {
        var all_themes = Array<Theme>()
        let vehicle_theme = Theme(name: "Vehicles", emojis: ["π", "π²", "βοΈ", "β΅οΈ", "π³", "π‘", "π΄", "π", "π", "π’", "π©", "π", "π", "π", "πΆ", "π", "π", "π", "π", "π", "π΅", "π", "π»", "π"], numberOfPairsOfCards: 10, color: "Yellow")
        all_themes.append(vehicle_theme)
        let animals_theme = Theme(name: "Animals", emojis: ["π", "π¦", "π¦", "π¬", "π΄", "π¦", "π§", "πΈ", "πΌ", "πΆ", "π", "π¦", "π", "π¦", "π", "π¦", "π¦", "π¦", "πΏ", "π¦", "π¦", "π¦", "π¨", "π¦"], numberOfPairsOfCards: 7, color: "Blue")
        all_themes.append(animals_theme)
        let activities_theme = Theme(name: "Activities", emojis: ["β½οΈ", "π", "π", "βΎοΈ", "π₯", "πΎ", "π", "π", "π₯", "π±", "πͺ", "π", "πΈ", "π", "π₯", "β³οΈ", "π", "πͺ", "βΈ", "π€Ώ", "π₯", "π₯", "β·", "π"], numberOfPairsOfCards: 10, color: "Green")
        all_themes.append(activities_theme)
        let fruits_theme = Theme(name: "Fruits", emojis: ["π", "π₯", "π", "π", "π", "π", "π", "π", "π«", "π"], numberOfPairsOfCards: 12, color: "Orange")
        all_themes.append(fruits_theme)
        let places_theme = Theme(name: "Places", emojis: ["βͺοΈ", "π", "π", "π", "π£"], numberOfPairsOfCards: 12, color: "Brown")
        all_themes.append(places_theme)
        let pastries_theme = Theme(name: "Pastries", emojis: ["π₯?", "π₯¨", "π", "π₯", "π§", "π₯§"], numberOfPairsOfCards: 4, color: "Indigo")
        all_themes.append(pastries_theme)
        
        return all_themes
    }
    
    private static func getColor(name: String) -> Color {
        switch(name.lowercased()) {
        case "yellow":
            return .yellow
        case "blue":
            return .blue
        case "green":
            return .green
        case "orange":
            return .orange
        case "indigo":
            return .indigo
        default:
                return .red
        }
    }
    
    private static func getRandomEmoji() -> Int {
        let emoji_index = EmojiMemoryGame.emoji_indexes.randomElement()!
        EmojiMemoryGame.emoji_indexes.remove(at: EmojiMemoryGame.emoji_indexes.firstIndex(of: emoji_index)!)
        return emoji_index
    }
    
    private var themes = createThemes()
    var selectedTheme: Theme
    var color: Color
    @Published private var model: MemoryGame<String>
    
    
    init() {
        selectedTheme = themes.randomElement()!
        model  = EmojiMemoryGame.createMemoryGame(theme: selectedTheme)
        color = EmojiMemoryGame.getColor(name: selectedTheme.color)
        model.score = 0
    }
        
    
    var cards: Array<Card> {
        return model.cards
    }
    
    var gameScore: Int {
        return model.score
    }
    
//    MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func startNewGame() {
        selectedTheme = themes.randomElement()!
        color = EmojiMemoryGame.getColor(name: selectedTheme.color)
        model  = EmojiMemoryGame.createMemoryGame(theme: selectedTheme)
        model.score = 0
    }
}
