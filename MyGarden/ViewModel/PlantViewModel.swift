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
            Entry(picture: PlantImages.flower1?.jpegData(compressionQuality: 0.8), notes: """
                This Prickly Pear has really taken off! The cactus has grown pretty tall 
                and the pads are looking really healthy. I’ve started seeing some little 
                fruit beginning to form, which is awesome. I didn’t expect it to be this 
                resilient, considering how hot and dry it can get around here. I’ve been 
                really careful with watering, not overdoing it. So far, it’s been doing 
                great, and I’m excited to see the fruit ripen soon!
                """, date: Date(timeIntervalSinceNow: -86400 * 7))
        ]),
        Plant(icon: "🌱", title: "Fiddle-Leaf Fig", latitude: 40.7128, longitude: -74.0060, entries: [
            Entry(picture: PlantImages.flower2?.jpegData(compressionQuality: 0.8), notes: """
                My Fiddle-Leaf Fig is growing way faster than I anticipated. The leaves 
                are enormous and still have that nice glossy shine. I’ve had some trouble 
                in the past with overwatering, but I think I’ve figured it out now. 
                I try to give it just enough water, not too much. It’s in a sunny spot, 
                which seems to make a huge difference. I think I’ll give it a new pot soon 
                because it’s definitely outgrowing this one.
                """, date: Date(timeIntervalSinceNow: -86400 * 14))
        ]),
        Plant(icon: "🌳", title: "Oak Tree", latitude: 47.6062, longitude: -122.3321, entries: [
            Entry(picture: PlantImages.flower3?.jpegData(compressionQuality: 0.8), notes: """
                The Oak Tree is still small, but I can see its potential. I’m definitely 
                looking forward to watching it grow into a strong, beautiful tree. It’s 
                still in the early stages, but the leaves are looking healthy and it 
                seems to be adapting well to the soil. I’ve read that these trees can 
                live for centuries, so I’m excited to have one in my yard. It’ll be fun 
                to watch it grow over the years.
                """, date: Date(timeIntervalSinceNow: -86400 * 30))
        ]),
        Plant(icon: "🌻", title: "Sunflower", latitude: 51.5074, longitude: -0.1278, entries: [
            Entry(picture: PlantImages.flower4?.jpegData(compressionQuality: 0.8), notes: """
                The Sunflower is just stunning right now! It’s grown so tall and the 
                bright yellow petals have really popped. I’ve been taking tons of photos 
                because it looks so perfect in the sunlight. The bees are loving it, 
                which is great for the garden. I’ve been watering it regularly, and it’s
                really been thriving in the summer heat. It’s so much fun to see it 
                grow and bloom. This one’s been a real highlight in the garden!
                """, date: Date(timeIntervalSinceNow: -86400 * 5))
        ]),
        Plant(icon: "🌴", title: "Palm Tree", latitude: 34.0522, longitude: -118.2437, entries: [
            Entry(picture: PlantImages.flower5?.jpegData(compressionQuality: 0.8), notes: """
                The Palm Tree is slowly becoming the centerpiece of the yard. The fronds 
                have gotten so tall, and I really love the tropical vibe it gives off. 
                I’ve made sure it gets plenty of sunlight, and I’m always careful not to 
                overwater it. It’s been pretty resilient so far, but I’m watching it 
                closely, especially when the winds pick up. I’m hoping it continues 
                to grow well over the next few seasons.
                """, date: Date(timeIntervalSinceNow: -86400 * 10))
        ]),
        Plant(icon: "🍅", title: "Tomato Plant", latitude: 43.6532, longitude: -79.3832, entries: [
            Entry(picture: PlantImages.flower6?.jpegData(compressionQuality: 0.8), notes: """
                This Tomato Plant is doing amazing! I’ve been picking tomatoes every 
                few days, and they’re super tasty. The vines have gotten a bit wild, 
                but I don’t mind. I’ve been giving it enough water and just enough 
                fertilizer to keep it happy. It’s a bit of a hassle to tie the stems up, 
                but totally worth it for the fresh fruit. There are still plenty more 
                tomatoes left to ripen, and I’m planning to use them in a big pasta dish soon!
                """, date: Date(timeIntervalSinceNow: -86400 * 3))
        ]),
        Plant(icon: "🌳", title: "Maple Tree", latitude: 45.5051, longitude: -73.5678, entries: [
            Entry(picture: PlantImages.flower7?.jpegData(compressionQuality: 0.8), notes: """
                The Maple Tree is changing colors beautifully. The leaves have turned 
                a deep red, and it’s just breathtaking to look at every morning. It’s 
                still pretty young, but I can see it becoming a real showstopper once 
                it matures. The fall foliage has been one of the highlights of the garden. 
                I’ve made sure to water it during the dry spells, but it doesn’t require 
                much maintenance. It’s definitely a tree that will stand out once 
                it’s fully grown.
                """, date: Date(timeIntervalSinceNow: -86400 * 21))
        ])
    ]

}

extension PlantViewModel {
    var newPlantTitleBinding: Binding<String> {
        Binding(
            get: { self.newPlantTitle },
            set: { self.newPlantTitle = $0 }
        )
    }
    
    var newPlantNotesBinding: Binding<String> {
        Binding(
            get: { self.newPlantNotes },
            set: { self.newPlantNotes = $0 }
        )
    }
    
    var newPlantImageBinding: Binding<UIImage?> {
        Binding(
            get: { self.newPlantImage },
            set: { self.newPlantImage = $0 }
        )
    }
    
    var newPlantDateBinding: Binding<Date?> {
        Binding(
            get: { self.newPlantDate },
            set: { self.newPlantDate = $0 }
        )
    }
}

enum PlantImages {
    static let flower1 = UIImage(named: "flower1")
    static let flower2 = UIImage(named: "flower2")
    static let flower3 = UIImage(named: "flower3")
    static let flower4 = UIImage(named: "flower4")
    static let flower5 = UIImage(named: "flower5")
    static let flower6 = UIImage(named: "flower6")
    static let flower7 = UIImage(named: "flower7")
}


