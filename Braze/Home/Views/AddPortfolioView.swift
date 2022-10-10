//
//  AddPortfolioView.swift
//  Braze
//
//  Created by Roy Aiyetin on 09/10/2022.
//

import SwiftUI

struct AddPortfolioView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    
    var selectedGradient: LinearGradient = LinearGradient(
        colors: [.theme.purple, .theme.blue, .theme.purple],
        startPoint: .leading, endPoint: .trailing)
    
    var clearGradient: LinearGradient = LinearGradient(colors: [.clear], startPoint: .bottom, endPoint: .top)
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading){
                    HeaderView()
                    
                    VStack(alignment: .leading) {
                        editPortfolioText
                        searchBar
                        noCoinFound //conditional View that shows when there are no coin results
                        coinLogoList //scrollView that enables selection of coin
                    }
                    .padding(.vertical)
                    
                }
            }
            .coordinateSpace(name: "scroll")
            .background(Color.theme.homeBackground.opacity(0.3))
            .ignoresSafeArea(.container, edges: .top)
            
            XMarkButton()
        }
        //tap any area outside the sheet to dismiss it
        
    }
    
}

struct AddPortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        AddPortfolioView()
        //            .preferredColorScheme(.dark)
            .environmentObject(dev.homeVM)
    }
}

extension AddPortfolioView {
    
    private var editPortfolioText: some View {
        
        Text("Edit Portfolio")
            .custom(font: .bold, size: 30)
            .padding(.horizontal)
            .padding(.vertical, isSmallHeight() ? 8:1)
    }
    
    private var searchBar: some View {
        SearchBarHomeView(searchText: $vm.searchText, showSearchBar: .constant(true), showPortfolio: .constant(false))
            .padding(.bottom, isSmallHeight() ? 12:16)
    }
    
    private var coinLogoList: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(isSmallHeight() ? 0:4)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.5)) {
                                selectedCoin = coin
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: isSmallHeight() ? 9:12)
                                .stroke(selectedCoin?.id == coin.id ?
                                        selectedGradient : clearGradient,
                                        lineWidth: isSmallHeight() ? 1.5:2.5
                                       )
                        )
                }
            }
            .padding(.vertical,4)
            .padding(.leading)
        }
    }
    
    private var noCoinFound: some View {
        
        LazyVStack {
            if vm.isSearchResultEmpty {
                NoCoinView()
                    .environmentObject(vm)
            }
        }
    }
    
}
