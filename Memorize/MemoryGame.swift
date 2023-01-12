//
//  MemoryGame.swift
//  Memorize
//
//  Created by Eunice Obugyei on 03/01/2023.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    var score: Int
    
    private var indexOfPreviousFaceUpCard: Int? {
        get {
            var faceUpCardIndices = [Int]()
                for index in cards.indices {
                    if cards[index].isFaceUp {
                        faceUpCardIndices.append(index)
                    }
                }
                if faceUpCardIndices.count == 1 {
                    return faceUpCardIndices[0]
                } else {
                    return nil
                }
        }
        set {
            cards.indices.forEach {cards[$0].isFaceUp = ($0 == newValue)}
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfPreviousFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    if cards[chosenIndex].alreadySeen {
                        score -= 1
                    }
                    if cards[potentialMatchIndex].alreadySeen {
                        score -= 1
                    }
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                for index in cards.indices {
                    if cards[index].isFaceUp {
                        cards[index].alreadySeen = true
                    }
                }
                indexOfPreviousFaceUpCard = chosenIndex
            }
            
        }
    }

    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        score = 0
//        add numberOfPairsOfCards = 2 cards to cards to array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
//        required task 13
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        let id: Int
        var isFaceUp = false
        var isMatched = false
        var alreadySeen = false
        let content: CardContent
    }
}
