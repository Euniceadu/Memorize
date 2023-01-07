//
//  Theme.swift
//  Memorize
//
//  Created by Eunice Obugyei on 07/01/2023.
//

import Foundation

//struct Themes {
//    
//    private(set) var themes: 
//    
//    
//}

struct Theme {
    private(set) var name: String
    private(set) var emojis: Array<String>
    private(set) var numberOfPairsOfCards: Int
    private(set) var color: String
    
    init(name: String, emojis: Array<String>, numberOfPairsOfCards: Int, color: String) {
        self.name = name
        self.emojis = emojis.shuffled()
        self.numberOfPairsOfCards = numberOfPairsOfCards
        if numberOfPairsOfCards > emojis.count {
            self.numberOfPairsOfCards = emojis.count
        }
        self.color = color
    }
}

