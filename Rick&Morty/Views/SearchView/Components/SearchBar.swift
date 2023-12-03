//
//  SearchBar.swift
//  Rick&Morty
//
//  Created by Optiva Media on 2/12/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isSearching: Bool

    var body: some View {
        HStack {
            TextField("Search...", text: $searchText)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .onTapGesture {
                    isSearching = true
                }

            if isSearching {
                Button(action: {
                    searchText = ""
                    isSearching = false
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(8)
                }
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(isSearching)
    }
}

