//
//  PlantViewModel.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 15/11/24.
//

import SwiftUI
import CoreLocation

@Observable
class PlantViewModel {
    var plants: [Plant] = []
    
    // Form state
    var newPlantImage: UIImage?
    var newPlantDate: Date?
    var selectedEmoji = "🌸" 
    var newPlantTitle: String = ""
    var newPlantNotes: String = ""
    
    let emojiOptions = ["🌸", "🌹", "🌺", "🌻", "🌼", "🌷", "💐", "🪷", "🍀"]
    
    func createNewPlant(at location: CLLocation?) {
        guard let location else { return }
        
        let entry = Entry(
            picture: newPlantImage?.jpegData(compressionQuality: 0.8),
            notes: newPlantNotes,
            date: Date()
        )
        
        let plant = Plant(
            icon: selectedEmoji,
            title: newPlantTitle,
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude,
            entries: [entry]
        )
        
        plants.append(plant)
        resetForm()
    }
    
    private func resetForm() {
        newPlantImage = nil
        newPlantDate = nil
        newPlantTitle = ""
        newPlantNotes = ""
        selectedEmoji = "🌸"
    }
    
    static let mockPlants: [Plant] = [
        Plant(icon: "🌵", title: "Prickly Pear", latitude: 32.7157, longitude: -117.1611, entries: [
            Entry(picture: Data(), notes: "Healthy and thriving", date: Date(timeIntervalSinceNow: -86400 * 7))
        ]),
        Plant(icon: "🌱", title: "Fiddle-Leaf Fig", latitude: 40.7128, longitude: -74.0060, entries: [
            Entry(picture: Data(), notes: "Needs more sunlight", date: Date(timeIntervalSinceNow: -86400 * 14))
        ]),
        Plant(icon: "🌳", title: "Oak Tree", latitude: 47.6062, longitude: -122.3321, entries: [
            Entry(picture: Data(), notes: "Recently planted, doing well", date: Date(timeIntervalSinceNow: -86400 * 30))
        ]),
        Plant(icon: "🌻", title: "Sunflower", latitude: 51.5074, longitude: -0.1278, entries: [
            Entry(picture: Data(), notes: "Blooming beautifully", date: Date(timeIntervalSinceNow: -86400 * 5))
        ]),
        Plant(icon: "🌴", title: "Palm Tree", latitude: 34.0522, longitude: -118.2437, entries: [
            Entry(picture: Data(), notes: "Requires regular watering", date: Date(timeIntervalSinceNow: -86400 * 10))
        ]),
        Plant(icon: "🍅", title: "Tomato Plant", latitude: 43.6532, longitude: -79.3832, entries: [
            Entry(picture: Data(), notes: "Producing lots of fruit", date: Date(timeIntervalSinceNow: -86400 * 3))
        ]),
        Plant(icon: "🌳", title: "Maple Tree", latitude: 45.5051, longitude: -73.5678, entries: [
            Entry(picture: Data(), notes: "Leaves are changing colors", date: Date(timeIntervalSinceNow: -86400 * 21))
        ])
    ]
}
