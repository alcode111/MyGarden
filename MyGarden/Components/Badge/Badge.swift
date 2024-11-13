//
//  Badge.swift
//  MariosMyGarden
//
//  Created by Luis Mario Recinos Hernández  on 12/11/24.
//

import SwiftUI


struct Badge: View {
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0, colorRotatedBadgeSymbol: Color("DarkGreen")
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}


#Preview {
    Badge()
}
