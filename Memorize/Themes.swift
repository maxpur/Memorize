//
//  Themes.swift
//  Memorize
//
//  Created by Maximilian Purrucker on 25.01.22.
//

import Foundation

struct Theme {
    var name: String
    var numberOfPairsOfCards: Int
    var cardColor: String
    var theme: Array<String>
    
    static let cars: Array<String> =
        ["🚗","🚕","🚙","🚌","🚎","🏎","🚓","🚒","🚐","🛻","🚚","🚛","🚜","🛺","🛵","🏍"]
    static let flags: Array<String> = ["🏳️‍🌈","🏳️‍⚧️","🇺🇳","🇦🇫","🇦🇽","🇦🇱","🇩🇿","🇦🇸","🇦🇩","🇦🇮","🇮🇩","🇮🇷","🇭🇳","🇩🇪","🇮🇸","🇭🇺","🇱🇷","🇷🇴","🇸🇰"]
    static let animals: Array<String> = ["🐶","🐱","🐭","🐰","🦊","🐻","🐼","🐨","🦁","🐮","🐷","🐵","🐣","🐠","🐙","🦦","🦨","🐓","🐳","🐢","🐝"]
    
    init(name: String, numberOfPairsOfCards: Int, cardColor: String, theme: Array<String>) {
        self.name = name
        self.numberOfPairsOfCards = numberOfPairsOfCards
        self.cardColor = cardColor
        self.theme = theme
    }
}
