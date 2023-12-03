//
//  DetailComponent.swift
//  Rick&Morty
//
//  Created by Optiva Media on 3/12/23.
//

import SwiftUI

struct DetailComponent: View {
    
    var title: String
    var text: String?
    
    var body: some View {
        HStack {
            Text(title)
                .padding(10)
                .font(.title2)
                .foregroundStyle(.white)
            
            Spacer()
            
            Text(text ?? "Not recorded")
                .padding(10)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    DetailComponent(title: "Name" ,text: "Pepe")
}
