//
//  SearchBarView.swift
//  Braze
//
//  Created by Roy Aiyetin on 07/10/2022.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @Binding var showSearchBar: Bool
    
    var radius: CGFloat = 30.0
    
    var body: some View {
        if self.showSearchBar {
            HStack {
                magnifyingGlassImage
                
                textfield
            }
            .font(.headline)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.theme.background)
                    .shadow(color: .theme.accentColor.opacity(0.15), radius: 10)
            )
            .padding(.horizontal)
            .transition(.move(edge: .trailing))
        } else {
            HStack {
                Text("Live Prices")
                    .font(.system(size: 20, design: .rounded)).bold()
                
                Spacer()
                ZStack {
                    Circle()
                        .stroke(LinearGradient(gradient: .init(colors: [.theme.blue,.theme.purple]), startPoint: .leading, endPoint: .trailing), lineWidth: 2.5)
                        .frame(width: radius, height: radius)
                    
                    magnifyingGlassImage
                }
                .onTapGesture {
                    withAnimation {
                        self.showSearchBar = true
                    }
                }
            }
            .padding(.horizontal, isSmallWidth() ? 8:10 )
            .padding(.top, isSmallHeight() ? 16:20)
            .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading).combined(with: .opacity)))
        }
    }
    
}


struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""), showSearchBar: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}

extension SearchBarView {
    
    //MARK: MagnifyingGlassImage
    private var magnifyingGlassImage: some View {
        Image(systemName: "magnifyingglass")
            .foregroundColor(searchText.isEmpty ? .theme.secondary : .theme.accentColor)
    }
    
    
    //MARK: TextField
    private var textfield: some View {
        TextField("Search by name or symbol...", text: $searchText)
            .disableAutocorrection(true)
            .foregroundColor(.theme.accentColor)
            .overlay(alignment: .trailing, content: {
                Image(systemName: "xmark.circle.fill")
                    .padding()
                    .offset(x:10)
                    .foregroundColor(.theme.purple)
                    .onTapGesture {
                        withAnimation {
                            self.showSearchBar = false
                        }
                        UIApplication.shared.didEndEditing()
                        searchText = " "
                    }
            })
    }
    
}
