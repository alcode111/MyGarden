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
        HStack{
            Image(uiImage: UIImage(data: entry?.picture ?? Data()) ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 110)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(alignment: .leading){
                Text("\(plant.icon) \(plant.title)")
                    .font(.title3)
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                
                if let date = entry?.date {
                    Text(FormatDatesAndTime.formattedDateWithTime(date))
                        .font(.caption)
                        .foregroundStyle(.gray)
                        .italic()
                } else {
                    Text("No entry date")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
        )
    }
}

#Preview {
    ZStack {
        Color.green.opacity(0.3).ignoresSafeArea()
        
        if let firstEntry = PlantViewModel.mockPlants.first?.entries.first {
            PlantCard(plant: PlantViewModel.mockPlants.first!, entry: firstEntry)
        }
    }
}
