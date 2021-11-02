//
//  Distance.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 02/11/2021.
//

// Distance
struct DistanceDataStruct: Decodable {
    var floors_climbed: Double?;
    var swimming: Swimming;
    var elevation: Elevation;
    var distance_metres: Double?;
    var steps: Double?;
};

struct Swimming: Decodable {
    var pool_length_metres: Double?;
    var num_laps: Double?;
    var num_strokes: Double?;
};
struct Elevation: Decodable {
    var gain_actual_metres: Double?;
    var avg_metres: Double?;
    var loss_actual_metres: Double?;
    var max_metres: Double?;
    var gain_planned_metres: Double?;
    var min_metres: Double?;
};
