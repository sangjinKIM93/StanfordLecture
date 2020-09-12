//
//  ContentView.swift
//  StanfordLecture
//
//  Created by 김상진 on 2020/09/09.
//  Copyright © 2020 kipCalm. All rights reserved.
//

import SwiftUI

struct EmojiMemoryView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    // 이 var는 메모리에 저장되는 것이 아니라 불릴때마다 계산되는 놈임.
    var body: some View {
        // some : "complier야. 내 body를 보고 어떤 타입이 return되어야 할지 판단해봐. 참고로 그것는 view처럼 행동할거야(behaves like a view)" - 왜냐하면 view 뿐만 아니라 view combiner가 return 될 수도 있거덩
        
        // HStack 안에 들어가면 내부의 뷰들은 HStack 화면에 맞게 크기가 조정된다
        HStack(spacing:0) {
            // Ztack 네개를 만든다.
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
                .padding(10)
                .foregroundColor(Color.orange)
                
        }
    }
}

//이런식으로 모듈화가 가능
struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        //GeometryReader를 활용하면 디바이스 크기에 맞게 size를 설정할 수 있어.
        GeometryReader { geometry in
            ZStack {
                if self.card.isFaceUp {
                    RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.edgeLineWidth)
                    RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
                    Text(self.card.content)
                } else {
                    RoundedRectangle(cornerRadius: self.cornerRadius).fill()
                }
            }
            .font(Font.system(size: self.fontSize(for: geometry.size)))
        }
    }
    
    //MARK: - Drawing constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}






















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryView(viewModel: EmojiMemoryGame())
    }
}
