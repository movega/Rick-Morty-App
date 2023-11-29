//
//  EpisodesView.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import SwiftUI

struct EpisodesView: View {
    
    @ObservedObject var viewModel = CharacterListViewModel()
    let infoHelper = InfoHelper()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    infoHelper.sectionTitle("Episodes")
                    ForEach(viewModel.episodes) { episode in
                        NavigationLink(destination: EpisodesDetailView(viewModel: EpisodesDetailViewModel(episode: episode))) {
                            EpisodeDetailViewCell(episode: episode)
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitle("Rick and Morty Universe", displayMode: .inline)
            .onAppear {
                viewModel.loadEpisodes()
            }
        }
    }
}

#Preview {
    EpisodesView()
}
