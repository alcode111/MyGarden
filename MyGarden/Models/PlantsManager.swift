//
//  PlantsManager.swift
//  MyGarden
//
//  Created by Ismaïl on 14/11/2024.
//

import Foundation
import UIKit
import CoreLocation
import SwiftUI

@Observable
class PlantsManager {
    var plants: [Plant] = []
    private let fileManager = LocalFileManager.shared
    
    func addPlant(title: String, notes: String?, emoji: String, image: UIImage, location: CLLocation) throws {
        let imageId = UUID().uuidString
        try fileManager.saveImage(image, name: imageId)
        
        let imageURL = fileManager.getImageURL(name: imageId)
        let entry = PlantEntry(
            imageURL: imageURL,
            notes: notes
        )
        
        let plant = Plant(
            title: title,
            notes: notes,
            emoji: emoji,
            location: .init(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude
            ),
            entries: [entry]
        )
        
        plants.append(plant)
    }
    
    func addEntry(to plant: Plant, image: UIImage, notes: String?) throws {
        let imageId = UUID().uuidString
        try fileManager.saveImage(image, name: imageId)
        
        let imageURL = fileManager.getImageURL(name: imageId)
        let entry = PlantEntry(
            imageURL: imageURL,
            notes: notes
        )
        
        if let index = plants.firstIndex(where: { $0.id == plant.id }) {
            plants[index].entries.append(entry)
        }
    }
}
