//
//  MarketPriceCard.swift
//  Braze
//
//  Created by Roy Aiyetin on 08/10/2022.
//

import SwiftUI

struct MarketStatisticsCard: View {
    
    let cardTitle: String
    let marketValue: String
    let stat: StatisticsModel
    let coin: CoinModel
    let imageSize: CGFloat = 30.0
    let colors: [Color]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            topPerformingCoinSection
            
            marketCapSection
            
        }
        .shadow(color: .black.opacity(0.1), radius: 2, x: 1, y: 2)
    }
    
}

struct MarketStatisticsCard_Previews: PreviewProvider {
    static var previews: some View {
        MarketStatisticsCard(cardTitle: "Top Performer", marketValue: "6.8", stat: dev.stat1, coin: dev.coin, colors: [.theme.red, Color.orange])
            .previewLayout(.sizeThatFits)
            .padding(20)
    }
}

extension MarketStatisticsCard {
    
    //MARK: topPerformingSection
    ///Add a small summary graph for the highest performer i.e the first element in the allCoins array
    private var topPerformingCoinSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Text(cardTitle)
                .custom(font: .regular, size: isSmallHeight() ? 11:14)
            
            VStack(alignment: .leading) {
                Text(coin.name)
                
                Text(coin.symbol.uppercased())
                    .custom(font: .regular, size: isSmallHeight() ? 10:12)
            }
            
            HStack {
                CoinImageView(coin: coin)
                    .frame(width:imageSize, height: imageSize)
                
                Spacer(minLength: 25)
                
                VStack(alignment: .trailing) {
                    Text((stat.percentageChange ?? 0) >= 0 ? "Profit" : "Loss")
                        .custom(font: .regular, size: isSmallHeight() ? 11:14)
                    
                    HStack(spacing:0) {
                        Image(systemName: "triangle.fill").font(.caption)
                            .rotationEffect( //rotate the arrow depending on profit or loss
                                Angle(degrees:(stat.percentageChange ?? 0) >= 0 ? 0:180))
                        
                        Text(marketValue)
                        
                    }
                    
                    Text(coin.currentPrice.asCurrencyWithTwoDecimals())
                }
            }
        }
        .custom(font: .bold, size: isSmallHeight() ? 11:14)
        .foregroundColor(.white)
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(20, corners: [.topLeft, .topRight])
    }
    
    //MARK: marketCapSection
    ///show market data i.e price, volume etc...
    private var marketCapSection: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(stat.title)
                    .custom(font: .regular, size: 12)
                
                Text(stat.value)
                    .custom(font: .bold, size: 15)
            }
            
            Spacer()
        }
        .foregroundColor(Color.black)
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
    }
    
}
