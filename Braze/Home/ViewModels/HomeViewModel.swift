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
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoins.append(DeveloperPreview.default.coin)
            self.portfolioCoins.append(DeveloperPreview.default.coin)
        }
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] (returnedCoin) in
                self?.allCoins = returnedCoin
            }
            .store(in: &cancellables)
    }
    
}
