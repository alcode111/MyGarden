//
//  PlantModels.swift
//  MyGarden
//
//  Created by Ismaïl on 14/11/2024.
//

import Foundation
import CoreLocation

@Observable
class Plant {
    let id: UUID
    var title: String
    var notes: String?
    var emoji: String
    var location: LocationCoordinate
    var createdAt: Date
    var entries: [PlantEntry]
    
    init(id: UUID = UUID(),
         title: String,
         notes: String?,
         emoji: String,
         location: LocationCoordinate,
         createdAt: Date = Date(),
         entries: [PlantEntry] = []) {
        self.id = id
        self.title = title
        self.notes = notes
        self.emoji = emoji
        self.location = location
        self.createdAt = createdAt
        self.entries = entries
    }
    
    struct LocationCoordinate: Codable {
        let latitude: Double
        let longitude: Double
        
        var coordinates: CLLocationCoordinate2D {
            CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
    }
}

extension Plant: Identifiable, Hashable {
    static func == (lhs: Plant, rhs: Plant) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

@Observable
class PlantEntry {
    let id: UUID
    let imageURL: URL
    let notes: String?
    let createdAt: Date
    
    init(id: UUID = UUID(),
         imageURL: URL,
         notes: String?,
         createdAt: Date = Date()) {
        self.id = id
        self.imageURL = imageURL
        self.notes = notes
        self.createdAt = createdAt
    }
}

extension PlantEntry: Identifiable, Hashable {
    static func == (lhs: PlantEntry, rhs: PlantEntry) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

