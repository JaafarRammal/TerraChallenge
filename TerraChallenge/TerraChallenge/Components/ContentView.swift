//
//  ContentView.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 01/11/2021.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    @ObservedObject var requestManager = HTTPRequest()
    @State var current_date = Date()
    
    init() {
        requestManager.requestDaily(date: current_date)
    }
    
    var body: some View {
        
        // main view
        NavigationView {
            ScrollView{
                VStack{
                    DateSelector(current_date: $current_date, dateChanged: {self.requestManager.requestDaily(date: current_date)})
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                        ForEach(cards(requestManager: requestManager), id: \.self) { card in
                            card
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitle("Daily Summary")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: HStack{
                    if(requestManager.pullingData){  ProgressView()
                    }
                }
            )
        }
    }
}


// self.requestManager.requestDaily(date: current_date)


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
