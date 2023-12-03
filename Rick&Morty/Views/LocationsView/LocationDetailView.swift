//
//  LocationDetailView.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import SwiftUI

struct LocationDetailView: View {
    
    @ObservedObject var viewModel = LocationDetailViewModel()
    let infoHelper = InfoHelper()
    
    var body: some View {
        ScrollView {
            VStack {
                DetailViewCell(title: "Name", text: viewModel.location?.name)
                DetailViewCell(title: "Type", text: viewModel.location?.type)
                DetailViewCell(title: "Dimension", text: viewModel.location?.dimension)
                DetailViewCell(title: "Type", text: viewModel.location?.created)
                
                infoHelper.sectionTitle("Characters")
                CharacterColumnsView(characters: viewModel.character)
            }
        }.onAppear {
            viewModel.loadMultipleCharacters(url: viewModel.location?.residents ?? [])
        }
        .navigationTitle(viewModel.location?.name ?? "").foregroundStyle(.white)
        .background(Color.black)
    }
}

#Preview {
    LocationDetailView()
}
