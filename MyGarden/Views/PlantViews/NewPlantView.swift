//
//  NewPlantView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 12/11/24.
//

import SwiftUI

import SwiftUI
import PhotosUI
import CoreLocation

struct NewPlantView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var locationManager = LocationManager()
    @State private var flowerImage: UIImage?
    @State private var title = ""
    @State private var notes = ""
    @State private var selectedEmoji = "🌸"
    @State private var showCamera = false
    
    let emojiOptions = ["🌸", "🌹", "🌺", "🌻", "🌼", "🌷", "💐", "🪷", "🍀"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    if let image = flowerImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                    
                    HStack {
                        Button(action: { showCamera = true }) {
                            Label("Take Photo", systemImage: "camera")
                        }
                    }
                }
                
                Section(header: Text("Choose Icon")) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(emojiOptions, id: \.self) { emoji in
                                Button(action: {
                                    selectedEmoji = emoji
                                }) {
                                    Text(emoji)
                                        .font(.title)
                                        .padding(10)
                                        .background(
                                            Circle()
                                                .fill(selectedEmoji == emoji ? Color.blue.opacity(0.2) : Color.clear)
                                        )
                                }
                            }
                            
                            Button(action: {
                                // Open native emoji picker
                                //                                selectedEmoji = showEmojiPicker()
                            }) {
                                Image(systemName: "plus")
                                    .font(.title)
                                    .padding(10)
                                    .background(
                                        Circle()
                                            .fill(Color.blue.opacity(0.2))
                                    )
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
                
                Section {
                    TextField("Title", text: $title)
                    TextField("Notes", text: $notes, axis: .vertical)
                        .lineLimit(4...6)
                }
            }
            .navigationTitle("Add New Flower")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        //                        saveFlower()
                        dismiss()
                    }
                }
            }
            
        }
        .fullScreenCover(isPresented: $showCamera) {
            //            CameraView(image: $flowerImage)
        }
    }
    
    private func saveFlower() {
        // Convert image to Data for storage
        let imageData = flowerImage?.jpegData(compressionQuality: 0.8)
        
        // Create new FlowerLocation
        let plantLocation = PlantLocation(
            coordinate: locationManager.location?.coordinate ?? CLLocationCoordinate2D(),
            title: title,
            emoji: selectedEmoji,
            imageData: imageData,
            notes: notes,
            dataCreated: Date()
        )
        
        // TODO: Save the flowerLocation to the database or file system
    }
}


#Preview {
    NewPlantView()
}
