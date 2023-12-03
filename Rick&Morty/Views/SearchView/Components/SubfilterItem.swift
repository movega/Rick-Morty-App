//
//  SubfilterItem.swift
//  Rick&Morty
//
//  Created by Optiva Media on 2/12/23.
//

import SwiftUI

struct SubfilterItem: View {
    
    @Binding var filters: [SearchFilter]
    var selectedFilter: SearchFilter
    
    var body: some View {
        Button(action: {
            for index in filters.indices {
                filters[index].isSelected = false
            }
            if let selectedIndex = filters.firstIndex(where: { $0.name == selectedFilter.name }) {
                filters[selectedIndex].isSelected = true
            }
        }) {
            Text(selectedFilter.name)
                .frame(height: 25)
                .padding(.horizontal)
                .background(selectedFilter.isSelected ? Color.purple : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
                .font(Font.custom("Baskerville-Bold", size: 20))
        }
    }
}


