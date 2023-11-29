//
//  CharacterListView.swift
//  Rick&Morty
//
//  Created by Optiva Media on 28/11/23.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject var viewModel = CharacterListViewModel()
    let infoHelper = InfoHelper()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    infoHelper.sectionTitle("Characters")
                    characterGrid
                }
                .padding()
            }
            .navigationBarTitle("Rick and Morty Universe", displayMode: .inline)
            .onAppear {
                viewModel.loadCharacters()
            }
        }
    }
    
    private var characterGrid: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
            ForEach(viewModel.characters) { character in
                CharacterCell(character: character)
            }
        }
        .padding(.horizontal)
    }
    
}

#Preview {
    CharacterListView(viewModel: CharacterListViewModel())
}
