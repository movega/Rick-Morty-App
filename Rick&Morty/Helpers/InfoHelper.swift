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
            .font(.title)
            .padding(.top, 16)
    }
}
