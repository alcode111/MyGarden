//
//  PreviewHelpers.swift
//  MyGarden
//
//  Created by Ismaïl on 14/11/2024.
//

import Foundation

#if DEBUG
enum PreviewData {
    static let plantsManager = PlantsManager()
    
    static let samplePlant = Plant(
        title: "My first Aloe",
        notes: "Beautiful plant",
        emoji: "🪴",
        location: .init(latitude: 37.7749, longitude: -122.4194),
        createdAt: Date(),
        entries: [
            PlantEntry(
                imageURL: URL(string: "placeholder")!,
                notes: "First day of planting",
                createdAt: Date()
            )
        ]
    )
    
    static let samplePlants: [Plant] = [
        samplePlant,
        Plant(
            title: "Snake Plant",
            notes: "Low maintenance",
            emoji: "🌿",
            location: .init(latitude: 37.7749, longitude: -122.4194),
            createdAt: Date().addingTimeInterval(-86400), // yesterday
            entries: []
        ),
        Plant(
            title: "Monstera",
            notes: "Growing fast!",
            emoji: "🌱",
            location: .init(latitude: 37.7749, longitude: -122.4194),
            createdAt: Date().addingTimeInterval(-172800), // 2 days ago
            entries: []
        )
    ]
}
#endif
