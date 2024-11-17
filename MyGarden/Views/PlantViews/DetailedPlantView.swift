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
    let plant: Plant
    let entry: Entry?
    
    var body: some View {
        ScrollView {
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
    DetailedPlantView(plant: PlantViewModel.mockPlants.first!, entry: PlantViewModel.mockPlants.first?.entries.first)
}

extension DetailedPlantView {
    private var header: some View {
        VStack(alignment: .leading) {
            Text("\(plant.icon) \(plant.title)")
                .bold()
                .font(.title)
            
            if let date = entry?.date {
                Text(FormatDatesAndTime.formattedDateWithTime(date))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .italic()
            } else {
                Text("No entry date")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                    .italic()
            }
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
        Image(uiImage: UIImage(data: entry?.picture ?? Data()) ?? UIImage())
            .resizable()
            .aspectRatio(4/3, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding()
            .padding(.top, -20)
    }
    
    private var notes: some View {
        VStack(alignment: .leading){
            if let newEntry = entry?.notes {
                Text(newEntry)
                    .lineLimit(isExpanded ? nil : 4)
                    .animation(.easeInOut, value: isExpanded)
                    .padding(.horizontal)
                    .font(.title2)
            } else {
                Text("No notes available")
                    .font(.body)
                    .foregroundStyle(.gray)
                    .padding(.horizontal)
            }
            
            HStack {
                Spacer()
                
                Button {
                    isExpanded.toggle()
                } label: {
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
