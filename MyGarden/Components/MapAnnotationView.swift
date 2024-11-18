//
//  MapAnnotationView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 13/11/24.
//

import SwiftUI

struct MapAnnotationView: View {
    var emoji: String
    
    var body: some View {
        VStack(spacing: 0) {
            Text(emoji)
                .font(.title)
                .padding(9)
                .background(
                    Circle()
                        .fill(.white)
                )
                .overlay(
                    Circle()
                        .stroke(.darkGreen, lineWidth: 5)
                )
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.darkGreen)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 83)
        }
    }
}

#Preview {
    ZStack {
        Color.black.opacity(0.5).ignoresSafeArea()
        MapAnnotationView(emoji: "🌸")
    }
}
