//
//  APIs.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 02/11/2021.
//

// Daily data API
struct DailyAPIResponse: Decodable {
    var status: String?;
    var type: String?;
    var data: [DailyData];
    // TODO: add user
}
