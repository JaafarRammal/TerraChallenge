//
//  FlipCard.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 03/11/2021.
//

// TODO: https://stackoverflow.com/questions/62754980/swiftui-card-flip-animation-with-two-views-one-of-which-is-embedded-within-a-st

import SwiftUI

struct FlipCard: View {
   @State var flippedCard: Int?
   @State var frontCard: Int?
   let cards = [1,2,3,4,5,6,7,8,9,10]
   
   var body: some View {
      let columns = [GridItem(.adaptive(minimum: 150))]
      
      GeometryReader { screenGeometry in
         ZStack {
            ScrollView {
               LazyVGrid(columns: columns, alignment: .center, spacing: 0) {
                  ForEach(cards, id: \.self) { card in
                     let isFaceUp = flippedCard == card
                     GeometryReader { cardGeometry in
                        ZStack {
                           SummaryCard(card: SummaryCardInfo(title: "Heart Beat", backgroundColor: .red, textColor: .white, value: "74.56", unit: "BPM", logo: "heart.fill"))
                            .modifier(FlipOpacity(pct: isFaceUp ? 0 : 1))
                              .rotation3DEffect(Angle.degrees(isFaceUp ? 180 : 360), axis: (0,1,0))
                              .frame(width: cardGeometry.size.width, height: cardGeometry.size.height)
                              .scaleEffect(isFaceUp ? screenGeometry.size.width / cardGeometry.size.width: 1)
                            .animation(.timingCurve(0, 0.5, 0.25, 0.25, duration: 0.5))
                           CardFrontView(card: card)
                              .modifier(FlipOpacity(pct: isFaceUp ? 1 : 0))
                              .rotation3DEffect(Angle.degrees(isFaceUp ? 0 : 180), axis: (0,1,0))
                              .frame(width: screenGeometry.size.width, height: screenGeometry.size.height)
                              .scaleEffect(isFaceUp ? 1 : cardGeometry.size.width / screenGeometry.size.width)
                            .animation(.timingCurve(0, 0.5, 0.25, 0.25, duration: 0.5))
                        }
                        .offset(x: isFaceUp ? -cardGeometry.frame(in: .named("mainFrame")).origin.x: -screenGeometry.size.width/2 + cardGeometry.size.width/2,
                                y: isFaceUp ? -cardGeometry.frame(in: .named("mainFrame")).origin.y: -screenGeometry.size.height/2 + cardGeometry.size.height/2)
                        .onTapGesture {
                           withAnimation(.linear(duration: 1.0)) {
                              if flippedCard == nil {
                                 flippedCard = card
                                 frontCard = card
                              } else if flippedCard == card {
                                 flippedCard = nil
                              }
                           }
                        }
                     }
                     .aspectRatio(1, contentMode: .fit)
                     .zIndex(frontCard == card ? 1 : 0)
                  }
               }
            }
         }
         .background(Color.black)
      }
      .coordinateSpace(name: "mainFrame")
   }
}

struct FlipOpacity: AnimatableModifier {
   var pct: CGFloat = 0
   
   var animatableData: CGFloat {
      get { pct }
      set { pct = newValue }
   }
   
   func body(content: Content) -> some View {
      return content.opacity(Double(pct.rounded()))
   }
}

struct CardBackView: View {
   var card: Int
   
   var body: some View {
      ZStack {
         RoundedRectangle(cornerRadius: 10)
            .fill(Color.red)
            .padding(5)
         Text("Back \(card)")
      }
   }
}

struct CardFrontView: View {
   var card: Int
   
   var body: some View {
      ZStack {
         RoundedRectangle(cornerRadius: 10)
            .fill(Color.blue)
            .padding(10)
            .aspectRatio(1.0, contentMode: .fit)
         Text("Front \(card)")
      }
   }
}

struct FlipCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FlipCard()
        }
    }
}
