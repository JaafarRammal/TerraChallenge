//
//  MET.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 02/11/2021.
//

//MET
struct METDataStruct: Decodable {
    var num_moderate_intensity_minutes: Double?;
    var num_low_intensity_minutes: Double?;
    var avg_level: Double?;
    var samples: Array<METSample>;
    var num_high_intensity_minutes: Double?;
    var num_inactive_minutes: Double?;
};

struct METSample: Decodable {
    var level: Double?;
    var timestamp: String?;
}
