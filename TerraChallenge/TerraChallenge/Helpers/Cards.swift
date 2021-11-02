//
//  Functions.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 02/11/2021.
//

import Foundation

func cards(requestManager: HTTPRequest) -> [SummaryCard]{
    
    let active_time = requestManager.dailyData.count <= 0 ? "_" : clip(value: requestManager.dailyData[0].active_durations_data.activity_seconds, transform: printTime)
    let active_split = active_time.split(separator: ",")
    let active_hours = active_time == "_" ? "_" : "\(active_split[0]) Hour\(active_split[0] == "1" ? "" : "s")"
    let active_minutes = active_time == "_" ? "" : "\(active_split[1]) Min"
    
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
    
    let active_card = SummaryCard(card: SummaryCardInfo(
        title: "Activity",
        backgroundColor: .yellow,
        textColor: .white,
        value: active_hours,
        unit: active_minutes,
        logo: "timer"
    ))
    
    let stress_level = SummaryCard(card: SummaryCardInfo(
        title: "Stress",
        backgroundColor: .blue,
        textColor: .white,
        value: requestManager.dailyData.count <= 0 ? "_" : clip(value: requestManager.dailyData[0].stress_data.avg_stress_level, precision: 0),
        unit: "AVG LEVEL",
        logo: "aqi.medium"
    ))
    
    let cards = [bpm_card, calories_card, steps_card, active_card, stress_level]
    
    return cards
}

func clip(value: Double?, precision: Int) -> String {
    if((value) != nil){
        return String(format: "%.\(precision)f", value!)
    }
    return "_"
}

func clip(value: Double?, transform: (_ input: Double) -> String) -> String {
    if((value) != nil){
        return transform(value!)
    }
    return "_"
}

func secondsToTime(seconds : Double) -> (Int, Int, Int) {
    let int_seconds = Int(seconds)
    return (int_seconds / 3600, (int_seconds % 3600) / 60, (int_seconds % 3600) % 60)
}

func printTime (seconds: Double) -> String {
    let (h, m, _) = secondsToTime(seconds: seconds)
    return "\(h),\(m)"
}
