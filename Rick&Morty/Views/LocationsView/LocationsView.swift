//
//  LocationsView.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import SwiftUI

struct LocationsView: View {
    @ObservedObject var viewModel = CharacterListViewModel()
    let infoHelper = InfoHelper()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    infoHelper.sectionTitle("Locations")
                    ForEach(viewModel.locations) { location in
                        LocationDetailViewCell(location: location)
                    }
                }
                .padding()
            }
            .navigationBarTitle("Rick and Morty Universe", displayMode: .inline)
            .onAppear {
                viewModel.loadLocations()
            }
        }
    }
}

#Preview {
    LocationsView()
}
