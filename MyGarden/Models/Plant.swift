//
//  Plant.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 15/11/24.
//

import Foundation

struct Plant: Identifiable {
    let id = UUID()
    var icon: String
    var title: String
    var latitude: Double
    var longitude: Double
    var entries: [Entry]
}


struct Entry: Identifiable {
    let id = UUID()
    var picture: Data?
    var notes: String?
    var date: Date
}
