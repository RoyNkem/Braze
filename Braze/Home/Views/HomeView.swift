//
//  ContentView.swift
//  Braze
//
//  Created by Roy Aiyetin on 26/09/2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    @State var showHoldingsColumn: Bool = false
    @State var showSearchBar: Bool = false
//    @State var isSearchEmpty: Bool = false
    
    private let rows: [GridItem]  = Array(repeating: GridItem(.adaptive(minimum: 200), spacing: 15), count: 1)
    private var radius: CGFloat = 25.0
    var width: CGFloat = 60
    var height: CGFloat = 60
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                topSection
                
                searchbar
                
                if !showPortfolio {
                    if !showSearchBar {
                        statisticsCard
                    }
                }
                
                if vm.allCoins.isEmpty {
                    noCoinFound
                }
                
                if !showPortfolio {
                    if !vm.allCoins.isEmpty {
                        columnTitles
                    }
                    allCoinsList
                        .transition(.move(edge: .trailing))
                } else {
                    portfolioCoinsList
                        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading).combined(with: .opacity)))
                }
            }
        }
        .background(Color.theme.homeBackground.opacity(0.3))
        .ignoresSafeArea(.container, edges: .top)
    }
    
}

//MARK: PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .preferredColorScheme(.dark)
            
            HomeView()
                .previewDevice("iPhone 13")
        }
        .environmentObject(dev.homeVM)
    }
    
}

extension HomeView {
    
    //MARK: topSection
    private var topSection: some View {
        VStack(alignment: .leading) {
            
            profileRow
            Text("Wallet(USD)")
                .foregroundColor(.white.opacity(0.7))
            priceRow
            buttonRow
            Spacer()
            
        }
        .padding(.top, isSmallHeight() ? 20 : 50)
        .padding()
        .foregroundColor(.white)
        .font(.system(size: isSmallHeight() ? 12 : 15))
        .background(LinearGradient(colors: [Color.theme.blue, Color.theme.purple], startPoint: .leading, endPoint: .trailing))
        .cornerRadius(isSmallHeight() ? 20:40, corners: [.bottomLeft, .bottomRight])
    }
    
    //MARK: profileRow
    private var profileRow: some View {
        HStack(spacing: 15) {
            Image("avatar")
                .resizable()
                .scaledToFill()
                .frame(width: isSmallHeight() ? width*0.75 : width, height: isSmallHeight() ? height*0.75 : height)
                .clipShape(RoundedRectangle(cornerSize: .init(width: radius/2, height: radius/2)))
                .overlay(content: {
                    RoundedRectangle(cornerRadius: radius/2)
                        .stroke(Color.white, lineWidth: 1)
                })
            
            Text("Hello, Roy").bold()
                .font(.system(size: isSmallHeight() ? 15:18))
                .foregroundColor(.white.opacity(0.8))
            
            Spacer()
            
            Button(action: {
                showPortfolio.toggle()
            }) {
                Image(systemName: "gear")
                    .font(.system(size:isSmallHeight() ? 20:25))
                    .foregroundColor(.white)
            }
        }
        .padding(.bottom, isSmallHeight() ? 10:16)
    }
    
    //MARK: buttonRow
    private var buttonRow: some View {
        HStack {
            Buttons(icon: "plus", text: "Add") {
                print("Clicked")
            }
            Spacer()
            Buttons(icon: "line.diagonal.arrow", text: "Send") {
                print("Clicked")
            }
            Spacer()
            Buttons(icon: "arrow.down", text: "Request") {
                print("Clicked")
            }
            Spacer()
            Buttons(icon: "menubar.dock.rectangle", text: "Bill") {
                print("Clicked")
            }
        }
        .padding(.horizontal, isSmallHeight() ? 9:12)
    }
    
    //MARK: priceRow
    private var priceRow: some View {
        HStack(alignment: .bottom, spacing: 0) {
            Text("$7,684.")
                .custom(font: .bold, size: isSmallHeight() ? 30:40)
            
            Text("00")
                .custom(font: .medium, size: isSmallHeight() ? 20:25)
                .offset(y: -5)
            
            Text("+4.34%").foregroundColor(.black)
                .padding(5)
                .background(Color.green.opacity(0.7))
                .cornerRadius(10)
                .padding(.leading)
                .offset(y: -10)
        }
        .padding(.bottom,isSmallHeight() ? 10:20)
    }
    
    //MARK: searchbar
    private var searchbar: some View {
        SearchBarView(searchText: $vm.searchText, showSearchBar: $showSearchBar, showPortfolio: $showPortfolio)
            .padding(.top, isSmallHeight() ? 2:4)
            .padding(.horizontal, 7)
    }
    
    //MARK: statisticsCard
    private var statisticsCard: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 15) {
                ForEach(vm.statistics) { stat in
                    MarketStatisticsCard(stat: stat, coin: CoinModel.instance, colors: stat.colors)
                }
            }
        }
        .padding(.leading)
    }
    
    //MARK: allCoinsList
    private var allCoinsList: some View {
        LazyVStack {
            ForEach(vm.allCoins) { coin in
                CoinRowViews(coin: coin, showHoldingsColumn: $showHoldingsColumn)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, isSmallHeight() ? 6:8)
        .padding(.vertical, isSmallHeight() ? 7:10)
    }
    
    //MARK: portfolioCoinsList
    private var portfolioCoinsList: some View {
        LazyVStack(alignment: .leading) {
            
            HStack {
                Text("Portfolio")
                    .custom(font: .bold, size: 30)
                    .font(.system(size: isSmallHeight() ? 23:30, weight: .bold, design: .rounded))
                
                Spacer()
            }
            
            ForEach(vm.allCoins) { coin in
                PortfolioRowViews(coin: coin)
            }
        }
        .padding(.horizontal, isSmallHeight() ? 6:8)
    }
    
    //MARK: columnTitles
    private var columnTitles: some View {
        
        HStack {
            Text("Coin")
                .offset(x: 25)
                .frame(width: UIScreen.main.bounds.width / 3, alignment: .leading)
            Spacer()
            Text("Last Price")
                .offset(x: 10)
                .frame(width: UIScreen.main.bounds.width / 3, alignment: .leading)
            Text("24h chg%")
                .offset(x: -15)
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .custom(font: .regular, size: isSmallWidth() ? 12:14)
        .foregroundColor(.theme.secondary)
        .padding(.top, isSmallHeight() ? 8:12)
        .padding(.horizontal, 8)
        .padding(.bottom, isSmallHeight() ? -6:-8)
    }
    
    //MARK: noCoinFound
    private var noCoinFound: some View {
        LazyHStack {
            LazyVStack {
                Text("We couldn't find any results for \(vm.searchText)...")
                    .custom(font: .bold, size: isSmallHeight() ? 14:16)
                    .lineLimit(1)
                    .padding(.vertical)

                Image(systemName: "magnifyingglass")
                    .font(.system(size: isSmallHeight() ? 36:50, weight: .bold))
            }
            .foregroundColor(.secondary)
        }
        .padding(.vertical, 30)
    }
    
}

