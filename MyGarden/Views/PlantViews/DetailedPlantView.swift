//
//  DetailedPlantView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 12/11/24.
//

import SwiftUI

struct DetailedPlantView: View {
    @State private var viewModel: DetailedPlantViewModel
    
    init(plant: Plant, plantsManager: PlantsManager) {
        _viewModel = State(initialValue: DetailedPlantViewModel(plant: plant, plantsManager: plantsManager))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(viewModel.emoji)
                Text(viewModel.plantTitle)
            }
            Text(viewModel.plantedDate)
                .foregroundStyle(.secondary)
            
            Text("Entries")
                .font(.headline)
            
            ForEach(viewModel.entries) { entry in
                // Your entry view here
                Text(viewModel.formattedDate(for: entry))
            }
        }
        .sheet(isPresented: $viewModel.showingImagePicker) {
            // Your image picker here
        }
        .alert("Error", isPresented: $viewModel.showingError) {
            Button("OK") { }
        } message: {
            Text(viewModel.errorMessage ?? "Unknown error")
        }
    }
}

#Preview {
    DetailedPlantView(
        plant: PreviewData.samplePlant,
        plantsManager: PreviewData.plantsManager
    )
}
