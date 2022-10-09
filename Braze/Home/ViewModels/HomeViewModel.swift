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
    
    @Published var isLoading: Bool = true
    @Published var isSearchResultEmpty: Bool = false //temp
    
    private var cancellables = Set<AnyCancellable>()
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    
    
    init() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.addSubscribers()
            self.isLoading = false
        }
    }
    
    func addSubscribers() {
        
        // data service instance calls the func `get coin` which makes the network request and append the output coin to `allCoins`
        //the received values of coins is stored in the publisher var `allCoins` for home VM to use in home view
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main) //publishes the 2 publishers after 0.5 seconds to allow users type tangible texts
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                
                guard let self = self else { return }
                self.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        marketDataService.$marketData
            .map(mapGlobalMarketData) //transform the returned market data model type to statistics model
            .sink { [weak self] (returnedStats) in
                guard let self = self else { return }
                self.statistics = returnedStats
            }
            .store(in: &cancellables)
        
    }
    
    //MARK: func filterCoins
    private func filterCoins(text: String, startingCoins: [CoinModel]) -> [CoinModel] {
        
        guard !text.isEmpty else {
            self.isSearchResultEmpty = false
            if !startingCoins.isEmpty {
                self.isSearchResultEmpty = false
            }
            return startingCoins
        }
        
        let lowercasedText = text.lowercased()
        
        let filteredCoins = startingCoins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
            
        for _ in (0..<1) {
            self.isSearchResultEmpty = false
            if filteredCoins.count == 0 {
                self.isSearchResultEmpty = true
            }
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
