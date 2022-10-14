//
//  SaveButtonAnimated.swift
//  Braze
//
//  Created by Roy Aiyetin on 11/10/2022.
//

import SwiftUI

enum SaveStatus {
    case ready
    case started
    case finished
}

struct SaveButtonAnimated: View {
    
    @State private var status: SaveStatus = .ready
    
    private var progressBarWidth: CGFloat = 30
    private var animationTime: TimeInterval = 0.1
    private var progressBarAnimationTime: TimeInterval = 0.5
    
    @State private var isPlaced = false
    
    var body: some View {
        ZStack() {
            Color.clear
                .edgesIgnoringSafeArea(.all)
            
                ZStack {
                    //first view background seen with "save"
                    if status != .finished {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(.linearGradient(colors: [Color(.white).opacity(0.8), Color(.white).opacity(0.6)], startPoint: .top, endPoint: .bottom))
                            .blendMode(.luminosity)
                            .frame(width: (status == .finished) ? 40 : 60,
                                   height: (status == .started) ? 30 : 30)
                            .animation(.linear(duration: animationTime - 0.1), value: status != .finished)
                            .shadow(color: .black.opacity(0.2), radius: 2, x: 1, y: 3)
                    }
                    
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(.linearGradient(colors: [Color(.systemBackground), Color(.systemBackground).opacity(0.6)], startPoint: .top, endPoint: .bottom))
                        .blendMode(.luminosity)
                        .frame(width: (status == .started) ? 60 : 60,
                               height: (status == .started) ? 30 : 30)
                        .shadow(color: .black.opacity(0.2), radius: 2, x: 1, y: 3)
                    
                    if status != .finished {
                        Text("Save")
                            .font(.system(size: isSmallHeight() ? 14:16, weight: .bold))
                            .foregroundColor(.black.opacity(0.7))
                            .opacity((status == .started) ? 0 : 1)
//                            .opacity((status == .ready) ? 1 : 0)
//                            .animation(.linear(duration: animationTime - 0.1))
                            .animation(.linear(duration: animationTime - 0.1), value: status != .finished)
                    }
                    
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(.black.opacity(0.7))
                        .opacity((status == .finished) ? 1 : 0)
                        .animation(.easeInOut(duration: 0.3), value: status == .finished)
                }
                .frame(width: progressBarWidth)
                .onTapGesture {
                    download()
                }
        }
        .frame(maxWidth: 70)
        .onTapGesture {

        }
    }
    
    func download() {
        isPlaced.toggle()
        
        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { timer in
            withAnimation {
                status = .started
            }        }
        
        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { timer in
            withAnimation {
                status = .finished
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            withAnimation {
                status = .ready
            }
        }
    }
    
}

struct SaveButtonAnimated_Previews: PreviewProvider {
    static var previews: some View {
        SaveButtonAnimated()
        //            .preferredColorScheme(.dark)
    }
}
