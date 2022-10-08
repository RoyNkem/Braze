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
    
    @Published var statistics: [StatisticsModel] = [StatisticsModel(title: "Market Cap", value: "$12.5Bn",  colors: [.theme.blue, .theme.purple]),
                                                    StatisticsModel(title: "Total Volume", value: "$20.2Tr", percentageChange: 20.03, colors: [.theme.purple.opacity(0.5), .theme.red]),
                                                    StatisticsModel(title: "Portfolio Value", value: "$50.4k", percentageChange: -5.17, coin: CoinModel.instance, colors: [.theme.blue, .theme.red])
                                                    ]
    @Published var showDetail: Bool = false
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    private let dataService = CoinDataService()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        // data service instance calls the func `get coin` which makes the network request and append the output coin to `allCoins`
        //the received values of coins is stored in the publisher var `allCoins` for home VM to use in home view
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main) //publishes the 2 publishers after 0.5 seconds to allow users type tangible texts
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
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
}
