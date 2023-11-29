//
//  EpisodeDetailViewCell.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import SwiftUI

struct EpisodeDetailViewCell: View {
    var episode: Episodes?
    
    var body: some View {
        NavigationLink(destination: EpisodesDetailView(viewModel: EpisodesDetailViewModel(episode: episode))) {
            VStack {
                EpisodeDetailComponent(title: "Episode", text: episode?.episode)
                EpisodeDetailComponent(title: "Name", text: episode?.name)
                EpisodeDetailComponent(title: "Air dated", text: episode?.air_date)
            }
            .frame(width: 350, height: 150)
            .shadow(radius: 5)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 2)
            )
        }
    }
}

struct EpisodeDetailComponent: View {
    
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
    EpisodeDetailViewCell(episode: Episodes(id: 1, name: "La vida en el mas alla", air_date: "12/31", episode: "Episode302", characters: [], url: "", created: "12/!1"))
}
