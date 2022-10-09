//
//  StatisticsModel.swift
//  Braze
//
//  Created by Roy Aiyetin on 08/10/2022.
//

import Foundation
import SwiftUI

class StatisticsModel: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    let coin: CoinModel?
    let colors: [Color]
    
    //custom init with percentageChange showing for initializatrion only when needed
    init(title: String, value: String, percentageChange: Double? = nil, coin: CoinModel? = nil, colors: [Color]) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
        self.coin = coin
        self.colors = colors
    }
}


