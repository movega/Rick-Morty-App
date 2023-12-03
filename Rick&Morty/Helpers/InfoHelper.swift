//
//  InfoHelper.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import Foundation
import SwiftUI

class InfoHelper {
    
    public func setUpBorderColor(status: String?) -> Color {
        switch status?.lowercased() {
        case "alive":
            return Color.green
        case "dead":
            return Color.red
        case "unknown":
            return Color.yellow
        default:
            return Color.blue
        }
    }
    
    public func sectionTitle(_ title: String) -> some View {
        Text(title)
            .font(.largeTitle)
            .padding(.leading)
            .foregroundStyle(Color.white)
    }
    
    func transformDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        if let date = dateFormatter.date(from: date) {
            dateFormatter.dateFormat = "dd-MM-yyyy"
            return dateFormatter.string(from: date)
        } else {
            return "Not recorded"
        }
    }
}
