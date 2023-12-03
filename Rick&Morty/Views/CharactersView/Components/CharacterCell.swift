//
//  CharacterCell.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import SwiftUI

struct CharacterCell: View {
    
    let character: Character?
    let infoHelper = InfoHelper()
    
    var body: some View {
        NavigationLink(destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character))) {
            VStack {
                AsyncImage(url: URL(string: character?.image ?? "")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFill()
                .frame(width: 140, height: 140)
                .cornerRadius(10)
                .shadow(radius: 5)
                
                Text(character?.name ?? "")
                    .foregroundStyle(.white)
                    .lineLimit(1)
                    .padding(.horizontal)
                    .font(Font.custom("Baskerville-Bold", size: 16))
            }
            .frame(width: 165, height: 200)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(infoHelper.setUpBorderColor(status: character?.status), lineWidth: 5)
            )
            .background(Color(hex: "#e1c094")).cornerRadius(10)
        }
    }
}

#Preview {
    CharacterCell(character: Character(id: 1, name: "Pepe", status: "Alive", species: "", type: "", gender: "", origin: Origin(name: "", url: ""), location: Location(name: "", url: ""), image: "", episode: [], url: ""))
}
