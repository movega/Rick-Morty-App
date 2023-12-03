//
//  DetailViewCell.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import SwiftUI

struct DetailViewCell: View {
    var title: String
    var text: String?
    let infoHelper = InfoHelper()
    
    var body: some View {
        HStack {
            Text(title)
                .padding(10)
                .foregroundStyle(.white)
                .font(Font.custom("Baskerville-Bold", size: 24))
            
            Spacer()
            
            if let text = text, !text.isEmpty {
                Text(text)
                    .padding(10)
                    .foregroundStyle(.white)
                    .font(Font.custom("Courier", size: 16))
            } else {
                Text("Not recorded")
                    .padding(10)
                    .foregroundStyle(.white)
                    .font(Font.custom("Courier", size: 16))
            }
        }
        .frame(width: 350, height: 50)
        .shadow(radius: 5)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(title == "Status" ? infoHelper.setUpBorderColor(status: text ?? "Not recorded") : Color(hex: "#b88c8c"), lineWidth: 4)
        )
        .background(Color(hex: "#107dac")).cornerRadius(10)
    }
}

#Preview {
    DetailViewCell(title: "Status", text: "Dead")
}
