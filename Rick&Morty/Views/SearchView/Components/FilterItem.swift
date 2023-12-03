//
//  FilterItem.swift
//  Rick&Morty
//
//  Created by Optiva Media on 2/12/23.
//

import SwiftUI

struct FilterItem: View {
    var filter: SearchFilter
    @Binding var selectedFilter: SearchFilter?

    var body: some View {
        Button(action: {
            selectedFilter = selectedFilter == filter ? nil : filter
        }) {
            Text(filter.name)
                .padding()
                .background(selectedFilter == filter ? Color.purple : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
                .font(Font.custom("Baskerville-Bold", size: 20))
        }
    }
}

