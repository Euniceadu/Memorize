//
//  ContentView.swift
//  Memorize
//
//  Created by Eunice Obugyei on 15/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚗", "🚲", "✈️", "⛵️", "🛳", "🚡", "🛴", "🚑", "🚍", "🚢", "🛩", "🚁", "🚎", "🚜", "🛶", "🚕", "🚙", "🚒", "🏎", "🚆", "🛵", "🏍", "🛻", "🚛"]
    var emojiCount = 12
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content: {emoji in CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)})
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
        
    }
}



struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
.previewInterfaceOrientation(.portrait)
        ContentView()
            .previewDevice("iPhone 11")
            .preferredColorScheme(.dark)
    }
}
