//
//  ContentView.swift
//  StanfordLecture
//
//  Created by 김상진 on 2020/09/09.
//  Copyright © 2020 kipCalm. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // 이 var는 메모리에 저장되는 것이 아니라 불릴때마다 계산되는 놈임.
    var body: some View {
        // some : "complier야. 내 body를 보고 어떤 타입이 return되어야 할지 판단해봐. 참고로 그것는 view처럼 행동할거야(behaves like a view)" - 왜냐하면 view 뿐만 아니라 view combiner가 return 될 수도 있거덩
        
        // HStack 안에 들어가면 내부의 뷰들은 HStack 화면에 맞게 크기가 조정된다
        HStack(spacing:0) {
            // Ztack 네개를 만든다.
            ForEach(0..<4) { index in
                CardView(isFaceUp: false)
            }
                .padding(10)
                .foregroundColor(Color.orange)
                .font(Font.largeTitle)
        }
    }
}

//이런식으로 모듈화가 가능
struct CardView: View {
    var isFaceUp: Bool  // Swift는 initialization을 해줘야해. 안 해주면 생성시 생성자로 해줘야함
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).stroke()
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}






















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
