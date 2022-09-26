//
//  ContentView.swift
//  Braze
//
//  Created by Roy Aiyetin on 26/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                HStack(spacing: 15) {
                    Image("avatar")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .cornerRadius(20)
                    
                    Text("Hello, Roy").bold()
                        .font(.system(size: 18))
                        .foregroundColor(.white.opacity(0.8))
                    
                    Spacer()
                    
                    Button(action: {
                        //Go to account settings
                    }) {
                        Image(systemName: "gear")
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom)
                
                Text("Wallet(USD)")
                    .foregroundColor(.white.opacity(0.7))
                
                HStack(alignment: .bottom, spacing: 0) {
                    Text("$7,684.")
                        .font(.system(size: 40, weight: .bold, design: .default))
                    
                    Text("00")
                        .font(.system(size: 25, weight: .medium, design: .default))
                        .offset(y: -3)
                    
                    Text("+4.34%").foregroundColor(.black)
                        .padding(5)
                        .background(Color.green.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.leading)
                        .offset(y: -4)
                }
                .padding(.bottom, 20)
                
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
                
                Spacer()
                
            }
            .padding(.top, 50)
            .padding()
            .foregroundColor(.white)
            .font(.system(size: 15))
            .background(LinearGradient(colors: [Color.theme.blue, Color.theme.purple], startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40, corners: [.bottomLeft, .bottomRight])
        }
        .ignoresSafeArea(.container, edges: .top)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //            .preferredColorScheme(.dark)
    }
}

