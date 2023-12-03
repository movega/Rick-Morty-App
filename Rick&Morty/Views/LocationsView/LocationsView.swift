//
//  LocationsView.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import SwiftUI

struct LocationsView: View {
    @ObservedObject var viewModel = LocationsViewModel()
    let infoHelper = InfoHelper()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    infoHelper.sectionTitle("Locations")
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))]) {
                        ForEach(viewModel.locations) { location in
                            LocationDetailViewCell(location: location)
                        }
                        Text("")
                            .onAppear {
                                viewModel.loadLocations()
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
    LocationsView()
}
