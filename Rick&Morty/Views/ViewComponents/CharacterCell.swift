//
//  CharacterCell.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import SwiftUI

struct CharacterCell: View {
    let image: String
    let name: String
    let status: String
    let infoHelper = InfoHelper()
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .scaledToFill()
            .frame(width: 140, height: 140)
            .cornerRadius(10)
            .shadow(radius: 5)
            
            Text(name)
                .foregroundStyle(.black)
                .lineLimit(1)
        }
        .frame(width: 165, height: 200)
        .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(infoHelper.setUpBorderColor(status: status), lineWidth: 5)
            )
        .cornerRadius(10)
    }
}

#Preview {
    CharacterCell(image: "", name: "Juan", status: "Alive")
}
