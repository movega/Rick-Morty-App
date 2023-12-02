//
//  FilterRow.swift
//  Rick&Morty
//
//  Created by Optiva Media on 2/12/23.
//

import SwiftUI

struct FilterRow: View {
    var filters: [SearchFilter]
    @Binding var selectedFilter: SearchFilter?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(filters, id: \.self) { filter in
                    FilterItem(filter: filter, selectedFilter: $selectedFilter)
                }
            }
        }.padding()
    }
}
