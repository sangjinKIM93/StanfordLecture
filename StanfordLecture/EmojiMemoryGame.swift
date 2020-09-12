//
//  EmojiMemoryGame.swift
//  StanfordLecture
//
//  Created by 김상진 on 2020/09/12.
//  Copyright © 2020 kipCalm. All rights reserved.
//

import SwiftUI

//** ViewModel
class EmojiMemoryGame {
    private var model: MemoryGame<String> = createMemoryGame() // 프로퍼티에 메서드를 넣을 수 없어. 왜냐하면 메서드에 대한 내용이 생성되기 전에 저장 메모리가 생성되거든. 단 staic으로 선언하면 메모리에 올라가 있기 때문에 가능함
        
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻","🎃"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    //MARK: - Acess Model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intent
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
