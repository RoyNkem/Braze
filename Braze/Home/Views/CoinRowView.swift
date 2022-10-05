//
//  CoinROwView.swift
//  Braze
//
//  Created by Roy Aiyetin on 01/10/2022.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    
    var body: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondary)
                .frame(minWidth: 30)
            
            Circle()
                .frame(width: 30, height: 30)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(.accentColor)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(coin.currentPrice.asCurrencyWithSixDecimals())
                    .bold()
                    .foregroundColor(.accentColor)
                
                Text("\(coin.priceChangePercentage24H ?? 0)%")
                    .foregroundColor(
                        (coin.priceChangePercentage24H ?? 0) >= 0 ?
                        Color.theme.green : Color.theme.red)
            }
        }
    }
}

struct CoinROwView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: dev.coin)
                .previewLayout(.sizeThatFits)
            
            CoinRowView(coin: dev.coin)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
//            CoinRowView(coin: dev.coin)
//                .preferredColorScheme(.dark)
//                .previewDevice("iPhone 13")
        }
    }
}
