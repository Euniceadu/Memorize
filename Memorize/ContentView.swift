//
//  ContentView.swift
//  Memorize
//
//  Created by Eunice Obugyei on 15/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text(viewModel.selectedTheme.name).font(.largeTitle).foregroundColor(viewModel.color)
            Spacer()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                    }
                }
            }
            .foregroundColor(viewModel.color)
            .padding(.horizontal)
            Spacer()
            Button(action: {viewModel.startNewGame()}, label: {Text("New Game")})
        
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
        ContentView(viewModel: game)
            .previewDevice("iPhone 11")
.previewInterfaceOrientation(.portrait)
        ContentView(viewModel: game)
            .previewDevice("iPhone 11")
            .preferredColorScheme(.dark)
    }
}
