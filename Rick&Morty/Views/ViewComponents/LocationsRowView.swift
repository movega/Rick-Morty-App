//
//  LocationsRowView.swift
//  Rick&Morty
//
//  Created by Optiva Media on 30/11/23.
//

import SwiftUI

struct LocationsRowView: View {
    var locations: [Locations]?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(locations ?? []) { location in
                    LocationDetailViewCell(location: location)
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    LocationsRowView()
}
