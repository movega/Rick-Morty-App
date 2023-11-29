//
//  InfoHelper.swift
//  Rick&Morty
//
//  Created by Optiva Media on 29/11/23.
//

import Foundation
import SwiftUI

struct InfoHelper {
    public func setUpBorderColor(status: String) -> Color {
        switch status {
        case "Alive":
            return Color.green
        case "Dead":
            return Color.red
        case "Unknown":
            return Color.yellow
        default:
            return Color.yellow
        }
    }
    
    public func sectionTitle(_ title: String) -> some View {
        Text(title)
            .font(.title)
            .padding(.top, 16)
    }
}
