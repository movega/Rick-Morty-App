//
//  LocationDetailViewCell.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import SwiftUI

struct LocationDetailViewCell: View {
    
    var location: Locations?
    
    var body: some View {
        NavigationLink(destination: LocationDetailView(viewModel: LocationDetailViewModel(location: location))) {
            VStack {
                LocationDetailComponent(title: "Name", text: location?.name)
                LocationDetailComponent(title: "Type", text: location?.type)
                LocationDetailComponent(title: "Dimension", text: location?.dimension)
                LocationDetailComponent(title: "Creation", text: location?.created)
            }
            .frame(width: 350, height: 200)
            .shadow(radius: 5)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
            )
        }
    }
}

struct LocationDetailComponent: View {
    
    var title: String
    var text: String?
    
    var body: some View {
        HStack {
            Text(title)
                .padding(10)
                .font(.title2)
                .foregroundStyle(.black)
            
            Spacer()
            
            Text(text ?? "Not recorded")
                .padding(10)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    LocationDetailViewCell(location: Locations(id: 1, name: "Pepe", type: "Tierra", dimension: "31", residents: [], url: "", created: "31/12"))
}
