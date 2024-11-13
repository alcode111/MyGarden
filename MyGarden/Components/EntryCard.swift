//
//  EntryCard.swift
//  MyGarden
//
//  Created by Muhammad Bilal on 13/11/24.
//

import SwiftUI

struct EntryCard: View {
    
    @State private var isExpanded = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .foregroundStyle(.white)
            VStack(alignment: .leading){
                Image("blueFlower")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                Text("Leadwort is a genus of flowering plants in the family Asteraceae, commonly known as daisy-like flowers. It is native to Europe, Asia, and North America, and is widely cultivated for its edible flowers.Leadwort is a genus of flowering plants in the family Asteraceae, commonly known as daisy-like flowers. It is native to Europe, Asia, and North America, and is widely cultivated for its edible flowers.")
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
                Text("Planted on 11/11/24 at 12:45")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding([.horizontal,.bottom], 20)
                
                
            }
        }


        
          
        
    }
}

#Preview {
    EntryCard()
}
