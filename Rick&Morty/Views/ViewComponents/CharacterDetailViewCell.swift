//
//  CharacterDetailViewCell.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import SwiftUI

struct CharacterDetailViewCell: View {
    var title: String
    var text: String?
    let infoHelper = InfoHelper()
    
    var body: some View {
        HStack {
            Text(title)
                .padding(10)
                .font(.title2)
            
            Spacer()
            
            Text(text ?? "Not recorded")
                .padding(10)
        }
        .frame(width: 350, height: 50)
        .shadow(radius: 5)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(title == "Status" ? infoHelper.setUpBorderColor(status: text ?? "Not recorded") : Color.black, lineWidth: 2)
            )
    }
}

#Preview {
    CharacterDetailViewCell(title: "Status", text: "Dead")
}
