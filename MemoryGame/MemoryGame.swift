//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by Юлия Чащина on 05.10.2018.
//  Copyright © 2018 Yulia Chashchina. All rights reserved.
//

import Foundation

class MemoryGame {
    
   private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    }else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set(newValue) {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue) // (index== newValue) - true, if not - false
            }
        }
    }
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "MemoryGame.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                // either no cards or two cards are face up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        } else {
//            cards[index].isFaceUp = true
//        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "MemoryGame.init(\(numberOfPairsOfCards)): you must have at least one pair of card")
        for _ in 1...numberOfPairsOfCards {
            
         let card = Card ()
          
//            cards.append(card)
//            cards.append(card)
            cards += [card, card]
        }
        // TODO: Shuffle the cards
    }
    
}
