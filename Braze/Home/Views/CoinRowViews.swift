//
//  CoinROwViews.swift
//  Braze
//
//  Created by Roy Aiyetin on 01/10/2022.
//

import SwiftUI

struct CoinRowViews: View {
    
    private let size: CGFloat = 32.0
    let coin: CoinModel
    @Binding var showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            //show holdings column
            if showHoldingsColumn {
                centreColumn
            }
            rightColumn
        }
        .font(.subheadline)
    }
}


struct CoinROwViews_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowViews(coin: dev.coin, showHoldingsColumn: .constant(false))
                .previewLayout(.sizeThatFits)
            
            CoinRowViews(coin: dev.coin, showHoldingsColumn: .constant(false))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}


extension CoinRowViews {
    
    //MARK: left Column
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondary)
                .frame(minWidth: 20)
            
            Rectangle()
                .frame(width: size, height: size)
                .cornerRadius(isSmallHeight() ? 8:12)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(.accentColor)
        }
    }
    
    //MARK: centre Column
    private var centreColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWithTwoDecimals())
                .bold()
            
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(.accentColor)
        .padding(.trailing, 10)
    }
    
    //MARK: right Column
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWithSixDecimals())
                .bold()
                .foregroundColor(.accentColor)
            
            Text(coin.priceChangePercentage24H?.asPercentageString() ?? "0")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.theme.green : Color.theme.red)
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
    
}
