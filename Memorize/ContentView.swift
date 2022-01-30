//
//  ContentView.swift
//  Memorize
//
//  Created by Maximilian Purrucker on 03.01.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.title + ":" + String(viewModel.points))
                
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                                print("Test")
                            }
                    }
                }
                .padding()
            }
            .foregroundColor(.red)
            .font(.largeTitle)
            .padding(.horizontal)
            Button("New Game") {
                viewModel.newGame()
            }.buttonStyle(.bordered)
        }
        .font(.title2)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.stroke(lineWidth: 3)
                shape.fill().foregroundColor(.white)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
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
        //ContentView(viewModel: game)
         //   .preferredColorScheme(.dark)
        //ContentView(viewModel: game)
        //    .preferredColorScheme(.light)
    }
}
