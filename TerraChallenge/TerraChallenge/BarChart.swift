//
//  BarChart.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 01/11/2021.
//

import Charts
import SwiftUI

struct Bar : UIViewRepresentable {
    //Bar chart accepts data as array of BarChartDataEntry objects
    var entries : [BarChartDataEntry]
    // this func is required to conform to UIViewRepresentable protocol
    func makeUIView(context: Context) -> LineChartView {
        //crate new chart
        let chart = LineChartView()
        //it is convenient to form chart data in a separate func
        chart.data = addData()
        return chart
    }
    
    // this func is required to conform to UIViewRepresentable protocol
    func updateUIView(_ uiView: LineChartView, context: Context) {
        //when data changes chartd.data update is required
        uiView.data = addData()
    }
    
    func addData() -> LineChartData{
        let data = LineChartData()
        //BarChartDataSet is an object that contains information about your data, styling and more
        let dataSet = LineChartDataSet(entries: entries)
        // change bars color to green
        dataSet.colors = [NSUIColor.cyan]
        //change data label
        dataSet.label = "My Data"
        data.addDataSet(dataSet)
        return data
    }
    
    typealias UIViewType = LineChartView
    
}



struct Bar_Previews: PreviewProvider {
    static var previews: some View {
        Bar(entries: [
            //x - position of a bar, y - height of a bar
            BarChartDataEntry(x: 1, y: 4),
            BarChartDataEntry(x: 2, y: 9),
            BarChartDataEntry(x: 3, y: 10),
            BarChartDataEntry(x: 4, y: 13),
            BarChartDataEntry(x: 5, y: 17)

        ])
    }
}
