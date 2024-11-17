//
//  DetailedPlantView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 12/11/24.
//

import SwiftUI

struct DetailedPlantView: View {
    
    @State var showNewEntryView = false
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            header
            
            addNewEntry
            
            flowerImage
            
            notes
            
            Spacer()
        }
        .fullScreenCover(isPresented: $showNewEntryView) {
            NewEntryView()
        }
    }
}
#Preview {
    DetailedPlantView()
}

extension DetailedPlantView {
    private var header: some View {
        VStack(alignment: .leading) {
            Text("🪻 My first Aloe")
                .bold()
                .font(.title)
            
            Text("Planted on 11/11/2024 at 12:45")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .italic()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var addNewEntry: some View {
        HStack {
            Text("Entries")
                .font(.title2)
                .bold()
            
            Spacer()
            
            Button {
                print("Pressed")
                showNewEntryView.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.title2)
                    .bold()
            }
        }
        .padding()
    }
    
    private var flowerImage: some View {
        Image(.flower1)
            .resizable()
            .aspectRatio(4/3, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding()
    }
    
    private var notes: some View {
        VStack(alignment: .leading){
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
            Text("Notes on 11/11/24 at 12:45")
                .font(.caption)
                .foregroundStyle(.gray)
                .padding([.horizontal,.bottom], 20)
        }
    }
}
