//
//  EpisodesDetailView.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import SwiftUI

struct EpisodesDetailView: View {
    @ObservedObject var viewModel = EpisodesDetailViewModel()
    let infoHelper = InfoHelper()
    
    var body: some View {
        ScrollView {
            VStack {
                CharacterDetailViewCell(title: "Episode", text: viewModel.episode?.episode)
                CharacterDetailViewCell(title: "Name", text: viewModel.episode?.name)
                CharacterDetailViewCell(title: "Air dated", text: viewModel.episode?.air_date)
                
                infoHelper.sectionTitle("Characters")
                CharactersRowView(characters: viewModel.character)
            }
        }.onAppear {
            viewModel.loadMultipleCharacters(url: viewModel.episode?.characters.first ?? "")
        }
    }
}

#Preview {
    EpisodesDetailView()
}
