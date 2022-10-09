//
//  HeaderView.swift
//  Braze
//
//  Created by Roy Aiyetin on 09/10/2022.
//

import SwiftUI

struct HeaderView: View {
    
    private var text1: String = "30% Commission for friends referral"
    private var text2: String = "Transaction fees to earn for every trade from a referral"
    
    var body: some View {
        VStack {
            Text(text1)
            Text(text2)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewLayout(.sizeThatFits)
            .padding(50)
    }
}
