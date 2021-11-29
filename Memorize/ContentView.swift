//
//  ContentView.swift
//  Memorize
//
//  Created by Patricio Cabo on 17/11/2021.
//

import SwiftUI

struct ContentView: View {
    let emojis  = ["😃","😞","👊🏼","🤲🏽","🤕","😧","👻","🤢","😷"]
    @State var emojiCount = 3
    
    var body: some View {
        VStack{
            HStack {
                ForEach(emojis[0..<emojiCount],id: \.self ){ emoji in
                    CardView(content: emoji)
                }
                
            }
            HStack{
                Button (action: {
                    emojiCount += 1
                }, label: {
                    VStack{
                        Text("Add")
                        Text("Card")
                    }
                    
                })
                Spacer()
                Button (action: {
                    emojiCount -= 1
                }, label: {
                    VStack{
                        Text("Remove")
                        Text("Card")
                    }
                    
                })
            }.padding(.horizontal)
            
        }
        .padding(.horizontal)
        .foregroundColor(.red)
        
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    var content : String
    
    var body : some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 4)
                Text(content)
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding(.horizontal,5)
                    .foregroundColor(.red)
            }else{
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
