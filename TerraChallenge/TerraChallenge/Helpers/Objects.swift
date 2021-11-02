//
//  Helpers.swift
//  TerraChallenge
//
//  Created by Jaafar Rammal on 01/11/2021.
//

import Foundation
import SwiftUI

// Summary Card Info
struct SummaryCardInfo: Hashable {
    var title: String;
    var backgroundColor: Color;
    var textColor: Color;
    var value: String;
    var unit: String;
    var logo: String;
}

// Set of Cards
struct SummaryCards {
    var heartbeat = SummaryCardInfo(
        title: "Heart Beat",
        backgroundColor: .red,
        textColor: .white,
        value: "",
        unit: "",
        logo: ""
    )
}
