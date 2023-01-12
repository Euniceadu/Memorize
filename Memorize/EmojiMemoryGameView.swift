//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Eunice Obugyei on 15/09/2022.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(game.selectedTheme.name).font(.largeTitle).foregroundColor(game.color)
                Spacer()
                Text("Score: ")
                Text("\(game.gameScore)")
                Spacer()
            }
            Spacer()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(game.cards) { card in
                        CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                    }
                }
            }
            .foregroundColor(game.color)
            .padding(.horizontal)
            Spacer()
            Button(action: {game.startNewGame()}, label: {Text("New Game")})
        
        }
        
    }
}



struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0.0)
            } else {
                shape.fill()
            }
        }
    }
}























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .previewDevice("iPhone 11")
.previewInterfaceOrientation(.portrait)
        EmojiMemoryGameView(game: game)
            .previewDevice("iPhone 11")
            .preferredColorScheme(.dark)
    }
}
