//
//  EntryCard.swift
//  MyGarden
//
//  Created by Muhammad Bilal on 13/11/24.
//

import SwiftUI

struct EntryCard: View {
    
    @State private var isExpanded = false
    var plant: Plant
    var entry: Entry?

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .foregroundStyle(.white)
            VStack(alignment: .leading){
                ScrollView{
                Image(uiImage: UIImage(data: entry?.picture ?? Data()) ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .border(Color.black, width: 1)
                    .padding()
                    Text(entry?.notes ?? "test")
                    .lineLimit(isExpanded ? nil : 4)
                    .animation(.easeInOut, value: isExpanded)
                    .padding(.horizontal)
                HStack {
                    Spacer()
                    Button(action: {
                        isExpanded.toggle()
                    }) {
                        Image(systemName: "chevron.down")
                            .rotationEffect(.degrees(isExpanded ? 180 : 0))
                            .animation(.easeInOut, value: isExpanded)
                            .font(.caption)
                            .foregroundColor(.blue)
                            .padding([.horizontal,.bottom], 10)
                    }
                }
                Divider()
                    .padding(.horizontal)
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
    }


        
          
        
    }
}

#Preview {
    EntryCard(plant: PlantViewModel.mockPlants.first!)
}
