//
//  Functions.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 02/11/2021.
//

import Foundation

func cards(requestManager: HTTPRequest) -> [SummaryCard]{
    let bpm_card = SummaryCard(card: SummaryCardInfo(
        title: "Heart Beat",
        backgroundColor: .red,
        textColor: .white,
        value: requestManager.dailyData.count <= 0 ? "_" : clip(value: requestManager.dailyData[0].heart_rate_data.summary.avg_hr, precision: 2),
        unit: "BPM",
        logo: "heart.fill"
    ))
    
    let calories_card = SummaryCard(card: SummaryCardInfo(
        title: "Calories",
        backgroundColor: .orange,
        textColor: .white,
        value: requestManager.dailyData.count <= 0 ? "_" : clip(value: requestManager.dailyData[0].calories_data.total_burned_calories, precision: 0),
        unit: "",
        logo: "flame.fill"
    ))
    
    let steps_card = SummaryCard(card: SummaryCardInfo(
        title: "Steps",
        backgroundColor: .green,
        textColor: .white,
        value: requestManager.dailyData.count <= 0 ? "_" : clip(value: requestManager.dailyData[0].distance_data.steps, precision: 0),
        unit: "STEPS",
        logo: "figure.walk"
    ))
    
    let distance_card = SummaryCard(card: SummaryCardInfo(
        title: "Distance",
        backgroundColor: .yellow,
        textColor: .white,
        value: requestManager.dailyData.count <= 0 ? "_" : clip(value: requestManager.dailyData[0].distance_data.distance_metres, precision: 0),
        unit: "M",
        logo: "ruler.fill"
    ))
    
    let stress_level = SummaryCard(card: SummaryCardInfo(
        title: "Stress",
        backgroundColor: .blue,
        textColor: .white,
        value: requestManager.dailyData.count <= 0 ? "_" : clip(value: requestManager.dailyData[0].stress_data.avg_stress_level, precision: 0),
        unit: "AVG LEVEL",
        logo: "aqi.medium"
    ))
    
    let cards = [bpm_card, calories_card, steps_card, distance_card, stress_level]
    
    return cards
}

func clip(value: Double?, precision: Int) -> String {
    if((value) != nil){
        return String(format: "%.\(precision)f", value!)
    }
    return "_"
}
