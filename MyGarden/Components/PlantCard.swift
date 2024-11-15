//
//  PlantCard.swift
//  MyGarden
//
//  Created by Simon Naud on 13/11/24.
//

import SwiftUI

struct PlantCard: View {
    var plant: Plant
    var entry: Entry?
    
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .foregroundStyle(.white)
                .frame(height: 130)
            HStack{
                Image(uiImage: UIImage(data: entry?.picture ?? Data()) ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 110)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .border(.black, width: 1)
                
                VStack(alignment: .leading){
                    Text(plant.title)
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    if let date = entry?.date {
                        Text("\(date)")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    } else {
                        Text("No entry date")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
            }
            .padding(10)
        }
    }
}

#Preview {
    let mockData = PlantViewModel()
    PlantCard(plant: mockData.mockPlants.first!)
}
