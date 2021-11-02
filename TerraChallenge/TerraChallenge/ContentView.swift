//
//  ContentView.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 01/11/2021.
//

import SwiftUI
import Charts

struct GridView: View {
    @State var cards: [SummaryCardInfo]
    let config = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        LazyVGrid(columns: config, spacing: 20) {
            ForEach(cards, id: \.self) { card in
                SummaryCard(card: card)
            }
        }
    }
}


struct ContentView: View {
    
    @ObservedObject var requestManager = HTTPRequest()
    @State var current_date = Date()
    
    var body: some View {
        ScrollView{
            VStack{
                HStack(alignment: .center){
                    DatePicker("", selection: $current_date, displayedComponents: [.date])
                        .onChange(of: current_date, perform: { value in
                            self.requestManager.requestDaily(date: current_date)
                        })
                        .labelsHidden()
                        .id(current_date)
                }
                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                GridView(cards: [
                    SummaryCardInfo(
                        title: "Heart Beat",
                        backgroundColor: .red,
                        textColor: .white,
                        value: String(requestManager.dailyData.count > 0 ? requestManager.dailyData[0].heart_rate_data.summary.avg_hr ?? 0.0 : 0.0),
                        unit: "",
                        logo: ""
                    )
                ])
                Text(String(requestManager.dailyData.count))
            }
            .padding()
        }
        
    }
}

// self.requestManager.requestDaily(date: current_date)


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
