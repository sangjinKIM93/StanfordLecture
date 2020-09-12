//
//  MemoryGame.swift
//  StanfordLecture
//
//  Created by 김상진 on 2020/09/12.
//  Copyright © 2020 kipCalm. All rights reserved.
//

import Foundation

//** Model
struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        // *특이한 점은 cardContent를 클로저 형태로 받아서 처리한다.
        // 근데 왜 굳이 클로저 형태로 만들었을까? 그냥 array로 받아서 for문 돌려도 됐을텐데
        // "하지만 String이 아닌 다른 타입이라면?"
        // factory패턴을 사용해야해. factory 패턴이란 subClass에게 인스턴스 생성을 넘기는 패턴이야.
        // 'CardContent 타입을 정하고 인스턴스 생성하는 것은 날 생성하는 놈에게 맡긴다.'
        
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    //struct 안에 있는 struct는 해당 struct 안에서만 접근할 수 있어
    struct Card: Identifiable{
        var inFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

