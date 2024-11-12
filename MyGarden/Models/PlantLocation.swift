//
//  PlantLocation.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 12/11/24.
//

import Foundation
import MapKit

struct PlantLocation: Identifiable {
    let id = UUID()
    
    let coordinate: CLLocationCoordinate2D
    let title: String
    let emoji: String
    let imageData: Data?
    let notes: String
    let dataCreated: Date
}
