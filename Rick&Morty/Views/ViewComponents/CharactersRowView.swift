//
//  CharactersRowView.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import SwiftUI

struct CharactersRowView: View {
    
    var characters: [Character]?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(characters ?? []) { character in
                    CharacterCell(image: character.image, name: character.name, status: character.status)
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    CharactersRowView(characters: [])
}
