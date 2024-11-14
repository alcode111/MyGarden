//
//  PlantModels.swift
//  MyGarden
//
//  Created by Ismaïl on 14/11/2024.
//

import Foundation
import MapKit

struct Plant: Identifiable, Codable {
    let id: UUID
    var title: String
    var notes: String?
    var emoji: String
    var location: LocationCoordinate
    var createdAt: Date
    var entries: [PlantEntry]
    
    struct LocationCoordinate: Codable {
        let latitude: Double
        let longitude: Double
        
        var coordinates: CLLocationCoordinate2D {
            CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
    }
}

struct PlantEntry: Identifiable, Codable {
    let id: UUID
    let imageURL: URL
    let notes: String?
    let createdAt: Date
}
