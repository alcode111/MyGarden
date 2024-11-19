//
//  PlantListView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 12/11/24.
//

import SwiftUI

struct PlantListView: View {
    @Environment(PlantViewModel.self) var vm
    
    var body: some View {
        NavigationStack{
            
            ZStack {
                Color.backgroundGreen
                ScrollView{
                    ForEach(vm.plants){ plant in
                        NavigationLink(destination: DetailedPlantView(plant: plant, entry: plant.entries.last)) {
                            PlantCard(plant: plant, entry: plant.entries.last)
                        }
                    }
                }
                .padding(.horizontal,10)
                
                .navigationTitle(Text("My Plants"))
            }
            
        }
        
    }
}

#Preview {
    PlantListView()
        .environment(PlantViewModel())
}
