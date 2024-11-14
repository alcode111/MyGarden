//
//  DetailedPlantViewModel.swift
//  MyGarden
//
//  Created by Ismaïl on 14/11/2024.
//

import Foundation
import UIKit
import SwiftUI

@Observable
class DetailedPlantViewModel {
    private let plantsManager: PlantsManager
    private let plant: Plant
    
    // UI State
    var isLoading = false
    var showingImagePicker = false
    var showingError = false
    var errorMessage: String?
    
    // UI Data
    var plantTitle: String { plant.title }
    var emoji: String { plant.emoji }
    var plantedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy 'at' HH:mm"
        return "Planted on \(formatter.string(from: plant.createdAt))"
    }
    var entries: [PlantEntry] { plant.entries.sorted { $0.createdAt > $1.createdAt } }
    
    init(plant: Plant, plantsManager: PlantsManager) {
        self.plant = plant
        self.plantsManager = plantsManager
    }
    
    func addNewEntry(image: UIImage, notes: String?) {
        isLoading = true
        do {
            try plantsManager.addEntry(to: plant, image: image, notes: notes)
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            showingError = true
            isLoading = false
        }
    }
    
    func formattedDate(for entry: PlantEntry) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy 'at' HH:mm"
        return formatter.string(from: entry.createdAt)
    }
}
