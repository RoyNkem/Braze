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
    
    private var radius: CGFloat = 25.0
    var width: CGFloat = 60
    var height: CGFloat = 60
    
    var body: some View {
        
        ScrollView {
            
            VStack {
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
                
                SearchBarView(searchText: $vm.searchText, showSearchBar: $showSearchBar, showPortfolio: $showPortfolio)
                    .padding(.top, isSmallHeight() ? 2:4)
                    .padding(.horizontal, 7)
                
                if !showPortfolio {
                    columnTitles
                    
                    allCoinsList
                        .transition(.move(edge: .trailing))
                }
                if showPortfolio {
                    portfolioCoinsList
                        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading).combined(with: .opacity)))
                }
                
                Spacer(minLength: 0)
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
    
    //MARK: profileRow
    private var profileRow: some View {
        HStack(spacing: 15) {
            Image("avatar")
                .resizable()
                .scaledToFill()
                .frame(width: isSmallHeight() ? width*0.75 : width, height: isSmallHeight() ? height*0.75 : height)
                .cornerRadius(isSmallHeight() ? 15:20)
            
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
        .padding(.top, isSmallHeight() ? 3:6)
        .padding(.horizontal, 8)
        .padding(.bottom, isSmallHeight() ? -9:-12)
    }
    
}

