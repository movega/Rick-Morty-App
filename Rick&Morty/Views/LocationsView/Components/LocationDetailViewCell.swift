//
//  LocationDetailViewCell.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import SwiftUI

struct LocationDetailViewCell: View {
    
    var location: Locations?
    let infoHelper = InfoHelper()
    
    var body: some View {
        NavigationLink(destination: LocationDetailView(viewModel: LocationDetailViewModel(location: location))) {
            VStack {
                DetailComponent(title: "Name", text: location?.name)
                DetailComponent(title: "Type", text: location?.type)
                DetailComponent(title: "Dimension", text: location?.dimension)
                DetailComponent(title: "Creation", text: infoHelper.transformDate(date: location?.created ?? ""))
            }
            .frame(width: 350, height: 200)
            .shadow(radius: 5)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 2)
            )
            .background(Color(hex: "#800080")).cornerRadius(10)
        }
    }
}

#Preview {
    LocationDetailViewCell(location: Locations(id: 1, name: "Pepe", type: "Tierra", dimension: "31", residents: [], url: "", created: "31/12"))
}
