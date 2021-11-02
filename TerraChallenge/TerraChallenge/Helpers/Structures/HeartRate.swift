//
//  HeartRate.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 02/11/2021.
//

// Heart Rate
struct HRSummary: Decodable {
    var user_hr_max: Double?;
    var min_hr: Double?;
    var avg_hr_variability: Double?;
    var avg_hr: Double?;
    var resting_hr: Double?;
    var max_hr: Double?;
};

struct HRDetailed: Decodable {
    var hrv_samples: Array<HRVSample>;
    var hr_samples: Array<HRSample>
}

struct HRDataStruct: Decodable {
    var summary: HRSummary;
    var detailed: HRDetailed;
};

struct HRVSample: Decodable {
    var bpm: Double?;
    var timestamp: String?;
}

struct HRSample: Decodable {
    var hrv: Double?;
    var timestamp: String?;
}
