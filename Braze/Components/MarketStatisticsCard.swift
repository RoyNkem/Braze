//
//  MarketPriceCard.swift
//  Braze
//
//  Created by Roy Aiyetin on 08/10/2022.
//

import SwiftUI

struct MarketStatisticsCard: View {
    
    let coin: CoinModel
    let imageSize: CGFloat = 40.0
    let colors: [Color] = [.theme.red, Color.orange]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            topPerformingCoinSection
            
            marketCapSection
            
        }
    }
    
}

struct MarketStatisticsCard_Previews: PreviewProvider {
    static var previews: some View {
        MarketStatisticsCard(coin: dev.coin)
            .previewLayout(.sizeThatFits)
    }
}

extension MarketStatisticsCard {
    
    //MARK: topPerformingSection
    ///Add a small summary graph for the highest performer i.e the first element in the allCoins array
    private var topPerformingCoinSection: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(coin.name)
                
                Spacer()
                
                Text(coin.symbol.uppercased())
                    .custom(font: .regular, size: isSmallHeight() ? 12:16)
            }
            
            HStack {
                CoinImageView(coin: coin)
                    .frame(width:imageSize, height: imageSize)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text((coin.priceChangePercentage24H ?? 0) >= 0 ? "Profit" : "Loss")
                        .custom(font: .regular, size: isSmallHeight() ? 12:16)
                    
                    HStack {
                        Image(systemName: "triangle.fill").font(.caption)
                        Text(coin.priceChangePercentage24H?.asPercentageString() ?? "0.0%")
                    }
                    
                    Text(coin.currentPrice.asCurrencyWithTwoDecimals())
                }
            }
        }
        .custom(font: .bold, size: isSmallHeight() ? 12:16)
        .foregroundColor(.white)
        .padding()
        .background(LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(20, corners: [.topLeft, .topRight])
    }
    
    //MARK: marketCapSection
    ///show market data i.e price, volume etc...
    private var marketCapSection: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Market Cap")
                    .custom(font: .regular, size: 15)
                
                Text("$199.00")
                    .custom(font: .bold, size: 25)
            }
            
            Spacer()
        }
        .foregroundColor(Color.black)
        .padding()
        .background(Color.white)
        .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
    }
    
}
