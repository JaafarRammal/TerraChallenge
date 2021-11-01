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
    
    var body: some View {
        VStack{
            Button(action: {
                self.requestManager.requestDaily(date: "2021-10-30")
            }) {
                HStack{
                    Spacer()
                    Text("Fetch Data")
                    Spacer()
                }
                .accentColor(Color.white)
                .padding(.vertical, 10)
                .background(Color.red)
                .cornerRadius(5)
                .padding(.horizontal, 40)

            }
            HStack{
                Spacer()
                DatePicker("Date", selection: $current_date, displayedComponents: [.date])
                Spacer()
            }
            
            Text("\(requestManager.dailyData.count)")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
