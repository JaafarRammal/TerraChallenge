//
//  Activity.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 02/11/2021.
//

// Activity
struct ActivityLevelSample: Decodable {
    var activity_level: Double?;
    var timestamp: String?;
}

struct ActiveDurationStruct: Decodable {
    var activity_seconds: Double?;
    var low_intensity_seconds: Double?;
    var rest_seconds: Double?;
    var num_continuous_inactive_periods: Double?;
    var inactivity_seconds: Double?;
    var activity_levels_samples: Array<ActivityLevelSample>;
    var moderate_intensity_seconds: Double?;
    var vigorous_intensity_seconds: Double?;
};
