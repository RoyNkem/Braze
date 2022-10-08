//
//  PortfolioRowViews.swift
//  Braze
//
//  Created by Roy Aiyetin on 02/10/2022.
//

import SwiftUI

struct PortfolioRowViews: View {
    
    let coin: CoinModel
    let spacing: CGFloat = 6.0
    let size: CGFloat = 45
    
    var body: some View {
        
        HStack {
                
            Rectangle()
                .frame(width: size, height: size)
                .foregroundColor(.theme.homeBackground)
                .overlay(CoinImageView(coin: coin))
                .cornerRadius(isSmallHeight() ? 8:12)
            
            VStack(alignment: .leading, spacing: spacing) {
                Text(coin.name)
                    .custom(font: .bold, size: isSmallHeight() ? 14:18)
                Text(coin.currentHoldingsValue.asNumberString() + " of portfolio")
                    .custom(font: .medium, size: isSmallHeight() ? 12:16)
                    .foregroundColor(.secondary)
            }
            .font(.system(size: isSmallWidth() ? 15:19, weight: .regular, design: .rounded))
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: spacing) {
                Text(coin.currentPrice.asCurrencyWithTwoDecimals())
                    .custom(font: .medium, size: isSmallHeight() ? 14:18)
                    .foregroundColor(.accentColor)
                    .cornerRadius(5)
                
                HStack(spacing: 0) {
                    Image(systemName:
                            (coin.priceChangePercentage24H ?? 0) > 0 ? "arrow.up" : "arrow.down" )
                            .font(.subheadline)
                    
                    Text(coin.priceChangePercentage24H?.asPercentageString() ?? "0%")
                        .custom(font: .medium, size: isSmallHeight() ? 14:18)
                }
                .foregroundColor((coin.priceChangePercentage24H ?? 0) > 0  ?
                                 Color.theme.increaseRate : .theme.decreaseRate)

            }
            
        }
        .padding()
        .background(Color.theme.portfolio)
        .cornerRadius(isSmallHeight() ? 13:15)
        .shadow(color: .theme.accentColor.opacity(0.15), radius: 10)
    }
    
}

struct PortfolioRowViews_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioRowViews(coin: dev.coin)
    }
}
