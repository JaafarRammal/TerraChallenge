//
//  Helpers.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 01/11/2021.
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

// Calories
struct CaloriesDataStruct: Decodable {
    var net_intake_calories: Double?;
    var net_activity_calories: Double?;
    var BMR_calories: Double?;
    var total_burned_calories: Double?;
}

// Other
struct Metadata: Decodable {
    var start_time: String?;
    var end_time: String?
};
struct DeviceData: Decodable {
    var software_version: String?;
    var manufacturer: String?;
    var serial_Int: String?;
    var name: String?;
    var hardware_version: String?;
};

// Daily Data
struct DailyData: Decodable {
    var stress_data: StressDataStruct;
    var MET_data: METDataStruct;
    var heart_rate_data: HRDataStruct;
    var active_durations_data: ActiveDurationStruct;
    var metadata: Metadata;
    var device_data: DeviceData;
    var distance_data: DistanceDataStruct;
    var calories_data: CaloriesDataStruct;
}

// TODO: User

// API response
struct APIResponse: Decodable {
    var status: String?;
    var type: String?;
    var data: [DailyData];
}
