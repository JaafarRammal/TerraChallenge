//
//  SummaryCard.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 02/11/2021.
//

import SwiftUI

struct SummaryCard: View {
    var card: SummaryCardInfo;
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(card.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(card.textColor)
                .padding()
                .frame(maxWidth: .infinity, alignment: .topTrailing)
            Spacer()
            HStack {
                Spacer()
                Image(systemName: card.logo)
                    .font(.title)
                Text(card.unit)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(card.textColor)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .topTrailing)
                
            }
            
            Text(card.value)
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundColor(card.textColor)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .background(card.backgroundColor)
        .foregroundColor(card.textColor)
        .cornerRadius(20)
//        .frame(width: 250, height: 250)
        .shadow(color: Color.gray.opacity(0.4), radius: 10, x: 10, y: 10)
    }
}

struct SummaryCard_Previews: PreviewProvider {
    static var previews: some View {
        SummaryCard(card: SummaryCardInfo(title: "Heart Beat", backgroundColor: .red, textColor: .white, value: "74.56", unit: "BPM", logo: "heart.fill"))
    }
}
