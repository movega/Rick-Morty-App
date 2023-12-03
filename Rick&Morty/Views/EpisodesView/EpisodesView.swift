//
//  EpisodesView.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import SwiftUI

struct EpisodesView: View {
    
    @ObservedObject var viewModel = EpisodesViewModel()
    let infoHelper = InfoHelper()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    infoHelper.sectionTitle("Episodes")
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))]) {
                        ForEach(viewModel.episodes) { episode in
                            EpisodeDetailViewCell(episode: episode)
                        }
                        Text("")
                            .onAppear {
                                viewModel.loadEpisodes()
                            }
                    }
                }
                .padding()
            }
            .navigationBarTitle("Rick and Morty Universe", displayMode: .inline)
            .background(Color.black)
        }
    }
}

#Preview {
    EpisodesView()
}
