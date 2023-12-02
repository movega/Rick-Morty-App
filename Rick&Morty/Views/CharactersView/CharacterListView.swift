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
                    CharacterColumnsView(characters: viewModel.characters)
                }
                .padding()
            }
            .navigationBarTitle("Rick and Morty Universe", displayMode: .inline)
            .onAppear {
                viewModel.loadCharacters()
            }
        }
    }
    
    
}

#Preview {
    CharacterListView(viewModel: CharacterListViewModel())
}
