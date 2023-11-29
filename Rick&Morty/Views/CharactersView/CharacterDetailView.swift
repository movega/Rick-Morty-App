//
//  CharacterDetailView.swift
//  Rick&Morty
//
//  Created by Optiva Media on 28/11/23.
//

import SwiftUI

struct CharacterDetailView: View {
    
    @ObservedObject var viewModel = CharacterDetailViewModel()
    let infoHelper = InfoHelper()

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: viewModel.character?.image ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFit()
                .frame(width: .infinity, height: 300)
                .cornerRadius(10)
                .shadow(radius: 5)
                
                CharacterDetailViewCell(title: "Name", text: viewModel.character?.name)
                CharacterDetailViewCell(title: "Status", text: viewModel.character?.status)
                CharacterDetailViewCell(title: "Gender", text: viewModel.character?.gender)
                CharacterDetailViewCell(title: "Species", text: viewModel.character?.species)
                CharacterDetailViewCell(title: "Type", text: viewModel.character?.type.isEmpty ?? false ? "Not recorded" : viewModel.character?.type)
                
                infoHelper.sectionTitle("Last seen")
                LocationDetailViewCell(location: viewModel.location)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.episodes ?? []) { episode in
                            EpisodeDetailViewCell(episode: episode)
                        }
                    }
                }
            }
        }.onAppear {
            viewModel.loadLocation(url: viewModel.character?.location.url ?? "")
            viewModel.loadMultipleEpisodes(url: viewModel.character?.episode ?? [])
        }
        .navigationTitle(viewModel.character?.name ?? "")
    }
}

