//
//  HTTPRequest.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 01/11/2021.
//

import Foundation
import SwiftUI
import Combine

class HTTPRequest: ObservableObject {

    @Published var dailyData: [DailyData] = []

    func requestDaily(date: Date) {
        
        // format date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        
        // create request
        guard var url = URLComponents(string: terra_endpoint + "/daily") else { return }
        url.queryItems = [
            URLQueryItem(name: "user_id", value: user_id),
            URLQueryItem(name: "to_webhook", value: "false"),
            URLQueryItem(name: "start_date", value: dateString)
        ]
        guard let urlURL = url.url else { return }
        var request = URLRequest(url: urlURL)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(dev_id, forHTTPHeaderField: "dev-id")
        request.setValue(api_key, forHTTPHeaderField: "X-API-Key")
        
        // send request
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                let jsonData = dataString.data(using: .utf8)!
                let apiRes: DailyAPIResponse = try! JSONDecoder().decode(DailyAPIResponse.self, from: jsonData)
                DispatchQueue.main.async {
                    self.dailyData = apiRes.data
                }
            }
        }.resume()
    }
}
