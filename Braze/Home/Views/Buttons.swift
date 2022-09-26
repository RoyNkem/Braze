//
//  Buttons.swift
//  Braze
//
//  Created by Roy Aiyetin on 26/09/2022.
//

import SwiftUI

struct Buttons: View {
    var icon: String
    var text: String
    var clicked: (() -> Void) //closure for callback
    
    var body: some View {
        VStack {
            Button(action: clicked) {
                Image(systemName: icon)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .padding()
                    .padding(.horizontal, icon == "menubar.dock.rectangle" ? -3:0) //the sf symbol for "bill" is much wider, so offset the padding
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
            }
            .shadow(color: .theme.background.opacity(0.2), radius: 2, x: 0, y: 1)
            
            Text(text)
                .foregroundColor(.white.opacity(0.8))
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons(icon: "plus", text: "Add") {
            print("Clicked")
        }
        .padding(40)
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
    }
}
