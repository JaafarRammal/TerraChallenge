//
//  DateSelector.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 02/11/2021.
//

import SwiftUI

struct DateSelector: View {
    @Binding var current_date: Date
    var dateChanged: () -> Void
    
    var body: some View {
        HStack(alignment: .top){
            Spacer()
            Button(action: {
                current_date = Calendar.current.date(byAdding: .day, value: -1, to: current_date)!
            }) {
                Image(systemName: "chevron.left")
                    .font(.body)
                    .foregroundColor(.blue)
                    .padding(.init(top: 8, leading: 0, bottom: 0, trailing: 0))
            }
            Spacer()
            DatePicker("", selection: $current_date, displayedComponents: [.date])
                .frame(alignment: .center)
                .labelsHidden()
                .id(current_date)
                .onChange(of: current_date, perform: { value in
                    dateChanged()
                })
            Spacer()
            Button(action: {
                current_date = Calendar.current.date(byAdding: .day, value: 1, to: current_date)!
            }) {
                Image(systemName: "chevron.right")
                    .font(.body)
                    .foregroundColor(.blue)
                    .padding(.init(top: 8, leading: 0, bottom: 0, trailing: 0))
            }
            Spacer()
        }
        .padding()
    }
}
