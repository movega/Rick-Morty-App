//
//  SplashView.swift
//  Rick&Morty
//
//  Created by Optiva Media on 3/12/23.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive = false
    @State var size = 0.6
    @State var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack {
                    Image("Prueba")
                        .font(.system(size: 100))
                    Text("Rick and Morty App")
                        .font(Font.custom("Baskerville-Bold", size: 32))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeOut(duration: 1.2)) {
                        self.size = 0.8
                        self.opacity = 1
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
