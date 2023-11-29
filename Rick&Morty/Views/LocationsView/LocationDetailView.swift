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
                CharacterDetailViewCell(title: "Name", text: viewModel.location?.name)
                CharacterDetailViewCell(title: "Type", text: viewModel.location?.type)
                CharacterDetailViewCell(title: "Dimension", text: viewModel.location?.dimension)
                CharacterDetailViewCell(title: "Type", text: viewModel.location?.created)
                
                infoHelper.sectionTitle("Characters")
                CharactersRowView(characters: viewModel.character)
            }
        }.onAppear {
            viewModel.loadMultipleCharacters(url: viewModel.location?.residents.first ?? "")
        }
        .navigationTitle(viewModel.location?.name ?? "")
    }
}

#Preview {
    LocationDetailView()
}
