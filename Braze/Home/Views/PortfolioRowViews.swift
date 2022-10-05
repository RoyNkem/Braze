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
    
    var body: some View {
        
        HStack {
            Rectangle()
                .frame(width: 45, height: 45)
                .cornerRadius(isSmallHeight() ? 8:12)
            
            VStack(alignment: .leading, spacing: spacing) {
                Text(coin.name)
                    .bold()
                
                Text(coin.currentHoldingsValue.asNumberString() + " of portfolio")
                    .foregroundColor(.secondary)
            }
            .font(.system(size: isSmallWidth() ? 15:19, weight: .regular, design: .rounded))
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: spacing) {
                Text(coin.symbol.uppercased())
                    .bold()
                    .foregroundColor(.accentColor)
                    .padding(.horizontal, isSmallHeight() ? 8:10)
                    .background(Color.theme.background)
                    .cornerRadius(5)
                
                Text(coin.priceChangePercentage24H?.asPercentageString() ?? "0%")
                    .foregroundColor((coin.priceChangePercentage24H ?? 0) > 0  ?
                                     Color.theme.green : .theme.red)
            }
            
        }
        .padding()
        .background(.ultraThickMaterial)
        .cornerRadius(isSmallHeight() ? 13:15)
    }
    
}

struct PortfolioRowViews_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioRowViews(coin: dev.coin)
            .previewDevice("iPhone 13")
//            .preferredColorScheme(.dark)
        //            .previewLayout(.sizeThatFits)
    }
}
