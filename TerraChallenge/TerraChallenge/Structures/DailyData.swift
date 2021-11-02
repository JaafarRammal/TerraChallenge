//
//  DailyData.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 02/11/2021.
//

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
