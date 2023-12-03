//
//  EpisodesRowView.swift
//  Rick&Morty
//
//  Created by Optiva Media on 30/11/23.
//

import SwiftUI

struct EpisodesRowView: View {
    var episodes: [Episodes]?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(episodes ?? []) { episode in
                    EpisodeDetailViewCell(episode: episode)
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    EpisodesRowView()
}
