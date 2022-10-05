//
//  ContentViewModel.swift
//  Braze
//
//  Created by Roy Aiyetin on 01/10/2022.
//

import Foundation
import Combine

//observe model from content view
class HomeViewModel: ObservableObject {
   
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    private let dataService = CoinDataService()
    
    init() {
       addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins // data service instance calls the func `get coin` which makes the network request and append the output coin to `allCoins`
            .sink { [weak self] (returnedCoin) in //the received values of all coins is stored in the publisher var for home VM to use in home view
                self?.allCoins = returnedCoin
            }
            .store(in: &cancellables)
    }
    
}
