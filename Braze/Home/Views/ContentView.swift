//
//  ContentView.swift
//  Braze
//
//  Created by Roy Aiyetin on 26/09/2022.
//

import SwiftUI

struct ContentView: View {
    var width: CGFloat = 60
    var height: CGFloat = 60
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
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
                        //Go to account settings
                    }) {
                        Image(systemName: "gear")
                            .font(.system(size:isSmallHeight() ? 20:25))
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, isSmallHeight() ? 10:16)
                
                Text("Wallet(USD)")
                    .foregroundColor(.white.opacity(0.7))
                
                HStack(alignment: .bottom, spacing: 0) {
                    Text("$7,684.")
                        .font(.system(size: isSmallHeight() ? 30:40, weight: .bold, design: .default))
                    
                    Text("00")
                        .font(.system(size: isSmallHeight() ? 20:25, weight: .medium, design: .default))
                        .offset(y: -3)
                    
                    Text("+4.34%").foregroundColor(.black)
                        .padding(5)
                        .background(Color.green.opacity(0.7))
                        .cornerRadius(10)
                        .padding(.leading)
                        .offset(y: -4)
                }
                .padding(.bottom,isSmallHeight() ? 10:20)
                
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
            .padding(.top, isSmallHeight() ? 20 : 50)
            .padding()
            .foregroundColor(.white)
            .font(.system(size: isSmallHeight() ? 12 : 15))
            .background(LinearGradient(colors: [Color.theme.blue, Color.theme.purple], startPoint: .leading, endPoint: .trailing))
            .cornerRadius(isSmallHeight() ? 20:40, corners: [.bottomLeft, .bottomRight])
        }
        .ignoresSafeArea(.container, edges: .top)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
            
            ContentView()
                .previewDevice("iPhone 13")
        }
    }
}

