//
//  AddPortfolioView.swift
//  Braze
//
//  Created by Roy Aiyetin on 09/10/2022.
//

import SwiftUI

struct AddPortfolioView: View {
    enum Field: Hashable {
        case searchBar
        case coinQuantity
    }
    
    @EnvironmentObject private var vm: HomeViewModel
    @FocusState var focusedField: Field? // enum above
    @State private var selectedCoin: CoinModel? = nil
    @State private var isShowingBottomCard:  Bool = false
    @State private var quantityText: String = ""
    @State private var searchBarY: CGFloat = 120
    @State private var coinQuantity: CGFloat = 0 // y axis coordinates
    @State private var circleY: CGFloat = 120
    @State private var showSaveButtoin: Bool = false
    
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
                        coinLogoList //scrollView that enables selection of coin after network request
                        
                        if selectedCoin != nil {
                            inputCoinQuantityField
                        }
                    }
                    .padding(.vertical)
                    
                }
            }
            .coordinateSpace(name: "scroll")
            .background(Color.theme.homeBackground.opacity(0.3))
            .ignoresSafeArea(.container, edges: .top)
            
            XMarkButton()
            
            CoinInfoSnippetView(isShowingCard: $isShowingBottomCard, coin: (selectedCoin ?? (vm.allCoins.first)) ?? CoinModel.instance) {
                
            }
        }
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
    
    //MARK: editPortfolioText
    private var editPortfolioText: some View {
        
        HStack {
            Text("Edit Portfolio")
                .custom(font: .bold, size: 30)
            
            Spacer()
            
            SaveButtonAnimated()
                .opacity(selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText) ? 1.0:0.0)
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
    
    //MARK: searchBar
    private var searchBar: some View {
        SearchBarView(searchText: $vm.searchText, showSearchBar: .constant(true), showPortfolio: .constant(false))
            .padding(.bottom, isSmallHeight() ? 12:16)
    }
    
    //MARK: coinLogoList
    private var coinLogoList: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.5)) {
                                selectedCoin = coin
                                isShowingBottomCard = true
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
            .padding(.leading)
        }
    }
    
    //MARK: addCoinQuantity
    private var addCoinQuantityField: some View {
        VStack(spacing: isSmallHeight() ? 12:20) {
            TextField("Enter Quantity to add", text: $quantityText)
                .custom(font: .medium, size: isSmallHeight() ? 15:18)
                .inputStyle(icon: "mail")
                .keyboardType(.decimalPad)
                .disableAutocorrection(true)
                .shadow(color: focusedField == .coinQuantity ? .primary.opacity(0.3) : .primary.opacity(0.3), radius: 10, x: 1, y: 3)
            
            HStack {
                Text("Current Value of Quantity:")
                Spacer()
                Text(getCurrentValue().asCurrencyWithTwoDecimals())
                    .bold()
            }
        }
    }
    
    private var geometry: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: CirclePreferenceKey.self, value: proxy.frame(in: .named("container")).minY)
        } //color.clear wont make view appear and will keep the layout
    }
    
    //MARK: noCoinFound
    private var noCoinFound: some View {
        
        LazyVStack {
            if vm.isSearchResultEmpty {
                NoCoinView()
                    .environmentObject(vm)
            }
        }
    }
    
    //MARK: func getCurrentValue
    private func getCurrentValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    //MARK: inputCoinQuantity
    private var inputCoinQuantityField: some View {
        VStack {
            HStack {
                Text("Current Price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWithTwoDecimals() ?? "")
                    .bold()
            }
            addCoinQuantityField
        }
        .padding(isSmallHeight() ? 12:17)
        .custom(font: .medium, size: isSmallHeight() ? 13:16)
    }
    
    private func saveButtonPressed() {
        
        guard let coin = selectedCoin else { return }
        
        // save to portfolio
        
        withAnimation {
            removeSelectedCoin()
        }
        
        //hide keyboard
        UIApplication.shared.didEndEditing()
        
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        vm.searchText = ""
    }
}
