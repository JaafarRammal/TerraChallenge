//
//  OtherData.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 02/11/2021.
//

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
