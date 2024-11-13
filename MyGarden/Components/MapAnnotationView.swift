//
//  MapAnnotationView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 13/11/24.
//

import SwiftUI

struct MapAnnotationView: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("🌸")
                .font(.title)
                .padding(9)
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
                .padding(.bottom, 40)
        }
    }
}

#Preview {
    MapAnnotationView()
}
