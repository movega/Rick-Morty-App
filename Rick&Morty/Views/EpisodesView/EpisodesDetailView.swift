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
                DetailViewCell(title: "Episode", text: viewModel.episode?.episode)
                DetailViewCell(title: "Name", text: viewModel.episode?.name)
                DetailViewCell(title: "Air dated", text: viewModel.episode?.air_date)
                
                infoHelper.sectionTitle("Characters")
                CharacterColumnsView(characters: viewModel.character)
                    .padding(.bottom)
            }
        }.onAppear {
            viewModel.loadMultipleCharacters(url: viewModel.episode?.characters ?? [])
        }
        .navigationTitle(viewModel.episode?.name ?? "")
        .background(Color.black)
    }
}

#Preview {
    EpisodesDetailView()
}
