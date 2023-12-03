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
                .frame(height: 300)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
                
                DetailViewCell(title: "Name", text: viewModel.character?.name)
                DetailViewCell(title: "Status", text: viewModel.character?.status)
                DetailViewCell(title: "Gender", text: viewModel.character?.gender)
                DetailViewCell(title: "Species", text: viewModel.character?.species)
                DetailViewCell(title: "Type", text: viewModel.character?.type.isEmpty ?? false ? "Not recorded" : viewModel.character?.type)
                
                infoHelper.sectionTitle("Last seen")
                LocationDetailViewCell(location: viewModel.location)
                
                infoHelper.sectionTitle("Episodes")
                EpisodesRowView(episodes: viewModel.episodes)
            }
        }.onAppear {
            viewModel.loadLocation(url: viewModel.character?.location.url ?? "")
            viewModel.loadMultipleEpisodes(url: viewModel.character?.episode ?? [])
        }
        .navigationTitle(viewModel.character?.name ?? "")
        .background(Color.black)
    }
}

#Preview {
    CharacterDetailView()
}

