//
//  ContentViewModel.swift
//  Braze
//
//  Created by Roy Aiyetin on 01/10/2022.
//

import Foundation
import Combine
import SwiftUI

//observe model from content view
class HomeViewModel: ObservableObject {
    
    @Published var statistics: [StatisticsModel] = []
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // data service instance calls the func `get coin` which makes the network request and append the output coin to `allCoins`
        //the received values of coins is stored in the publisher var `allCoins` for home VM to use in home view
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main) //publishes the 2 publishers after 0.5 seconds to allow users type tangible texts
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        marketDataService.$marketData //transform the returned market data model type to statistics model
            .map(mapGlobalMarketData)
            .sink { [weak self] (returnedStats) in
                self?.statistics = returnedStats
            }
            .store(in: &cancellables)
        
    }
    
    //MARK: func filterCoins
    private func filterCoins(text: String, startingCoins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return startingCoins
        }
        let lowercasedText = text.lowercased()
        
        let filteredCoins = startingCoins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
        
        return filteredCoins
    }
    
    //MARK: func mapGlobalMarketData
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?) -> [StatisticsModel] {
        var stats: [StatisticsModel] = []
        
        guard let data = marketDataModel else {
            return stats
        }
        
        let marketCap = StatisticsModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd, colors: [.theme.blue, .theme.purple])
        
        let volume = StatisticsModel(title: "Total Volume 24h", value: data.volume, colors: [.theme.purple.opacity(0.5), .theme.red])
        
        let btcDominance = StatisticsModel(title: "BTC Dominance", value: data.btcDominant, colors: [.theme.blue, .theme.red])
        
        let portfolio = StatisticsModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0.0, colors: [.theme.red, .orange])
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        return stats
    }
    
}
