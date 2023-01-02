//
//  ContentView.swift
//  Memorize
//
//  Created by Eunice Obugyei on 15/09/2022.
//

import SwiftUI

struct ContentView: View {
    var vehicles = ["🚗", "🚲", "✈️", "⛵️", "🛳", "🚡", "🛴", "🚑", "🚍", "🚢", "🛩", "🚁", "🚎", "🚜", "🛶", "🚕", "🚙", "🚒", "🏎", "🚆", "🛵", "🏍", "🛻", "🚛"]
    var animals = ["🐝", "🦀", "🦋", "🐬", "🐴", "🦄", "🐧", "🐸", "🐼", "🐶", "🐒", "🐦", "🐓", "🦜", "🐋", "🦖", "🦆", "🦅", "🐿", "🦚", "🦈", "🦎", "🐨", "🦊"]
    var activities = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🥏", "🎱", "🪀", "🏓", "🏸", "🏏", "🥊", "⛳️", "🏑", "🪁", "⛸", "🤿", "🥍", "🥅", "⛷", "🏂"]
    @State var emojis = ["🚗", "🚲", "✈️", "⛵️", "🛳", "🚡", "🛴", "🚑", "🚍", "🚢", "🛩", "🚁", "🚎", "🚜", "🛶", "🚕", "🚙", "🚒", "🏎", "🚆", "🛵", "🏍", "🛻", "🚛"]
    @State var emojiCount = 4
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content: {emoji in CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)})
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                HStack {
                    Button(action: {emojis = vehicles}, label: {
                        VStack{
                            Image(systemName: "car")
                            Text("Vehicles").font(.footnote)
                        }})
                    
                    Button(action: {emojis = animals}, label: {
                        VStack{
                            Image(systemName: "tortoise")
                            Text("Animals").font(.footnote)
                        }})
                    Button(action: {emojis = activities}, label: {
                        VStack{
                            Image(systemName: "figure.walk")
                            Text("Activities").font(.footnote)
                        }
                    })
                }
                Spacer()
                add
                
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        
    }
    
    var remove: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
            
        }, label: {
            Image(systemName: "minus.circle")})
    }
    
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }, label: {Image(systemName: "plus.circle")})
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
