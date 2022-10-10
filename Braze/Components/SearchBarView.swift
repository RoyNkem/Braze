//
//  SearchBarView.swift
//  Braze
//
//  Created by Roy Aiyetin on 10/10/2022.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            magnifyingGlassImage
            
            textfield
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(color: .theme.accentColor.opacity(0.15), radius: 5, x: 1, y: 2)
        )
        .padding(.horizontal)
        .transition(.move(edge: .trailing))
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
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
            .custom(font: .regular, size: isSmallWidth() ? 14:18)
            .disableAutocorrection(true)
            .foregroundColor(.theme.accentColor)
            .overlay(alignment: .trailing, content: {
                Image(systemName: "xmark.circle.fill")
                    .padding()
                    .offset(x:10)
                    .foregroundColor(.theme.purple)
                    .onTapGesture {
                        withAnimation {

                        }
                        UIApplication.shared.didEndEditing()
                        searchText.removeAll()
                    }
            })
    }

}
