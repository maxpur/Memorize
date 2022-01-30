//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Maximilian Purrucker on 06.01.22.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚕","🚗","🚌","🚑","🚒","🚃","🚞","🦼","🚚","🚛","🦽","🚤","🚀","🚍","🚁","🛶","⛵️","✈️","🏍","🏎","🚙","🚎","🛻","🚜"]
    static let cars: Theme = Theme(name: "cars", numberOfPairsOfCards: 6, cardColor: "red", theme: Theme.cars)
    static let animals: Theme = Theme(name: "animals", numberOfPairsOfCards: 80, cardColor: "green", theme: Theme.animals)
    static let flags: Theme = Theme(name: "flags", numberOfPairsOfCards: 5, cardColor: "blue", theme: Theme.flags)
    static let themes: Array<Theme> = [cars, animals, flags]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 8) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    static func createMemoryGameByTheme() -> MemoryGame<String> {
        var chosenTheme: Theme? = themes.randomElement()
        if chosenTheme!.numberOfPairsOfCards > chosenTheme!.theme.count {
            chosenTheme!.numberOfPairsOfCards = chosenTheme!.theme.count
        }
        chosenTheme!.theme.shuffle()
        return MemoryGame(numberOfPairsOfCards: chosenTheme!.numberOfPairsOfCards, title: chosenTheme!.name) {pairIndex in
            chosenTheme!.theme[pairIndex]
        }
    }
        
    @Published private var model: MemoryGame<String> = createMemoryGameByTheme()//createMemoryGame()

    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var title: String {
        model.title
    }
    
    var points: Int {
        model.points
    }
    
    // MARK: -Intent(s)
    func choose(_ card:MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGameByTheme()
        print(model)
    }
    
}
