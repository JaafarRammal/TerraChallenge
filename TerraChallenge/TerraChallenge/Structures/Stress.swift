//
//  Stress.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 02/11/2021.
//

// Stress
struct StressDataStruct: Decodable {
    var medium_stress_duration: Double?;
    var low_stress_duration: Double?;
    var avg_stress_level: Double;
    var activity_stress_duration: Double?;
    var rest_stress_duration: Double?;
    var stress_duration: Double?;
    var max_stress_level: Double?;
    var high_stress_duration: Double?;
    var samples: Array<StressData>
};

struct StressData: Decodable {
    var level: Double?;
    var timestamp: String?;
}
