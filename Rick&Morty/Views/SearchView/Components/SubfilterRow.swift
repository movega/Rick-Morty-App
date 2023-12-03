//
//  SubfilterRow.swift
//  Rick&Morty
//
//  Created by Optiva Media on 2/12/23.
//

import SwiftUI

struct SubfilterRow: View {
    @Binding var filters: [SearchFilter]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(filters, id: \.self) { filter in
                    SubfilterItem(filters: $filters, selectedFilter: filter)
                }
            }
        }.padding(.horizontal)
    }
}
