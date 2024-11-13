//
//  PlantCard.swift
//  MyGarden
//
//  Created by Simon Naud on 13/11/24.
//

import SwiftUI

struct PlantCard: View {
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .foregroundStyle(.white)
                .frame(height: 130)
            HStack{
                Image("blueFlower")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 110)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                VStack(alignment: .leading){
                    Text("🪻My first Leadwort")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("Planted on 11/11/24 at 12:45")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            }
            .padding(10)
        }
    }
}

#Preview {
    PlantCard()
}
