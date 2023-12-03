//
//  CharactersView.swift
//  Rick&Morty
//
//  Created by Optiva Media on 28/11/23.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var viewModel = CharactersViewModel()
    let infoHelper = InfoHelper()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    infoHelper.sectionTitle("Characters")
                    CharacterColumnsView(characters: viewModel.characters, viewModel: viewModel)
                }
                .padding()
            }
            .navigationBarTitle("Rick and Morty Universe", displayMode: .inline)
            .background(Color.black)
        }
    }
}

#Preview {
    CharactersView(viewModel: CharactersViewModel())
}
