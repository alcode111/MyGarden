//
//  NewPlantView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 12/11/24.
//

import SwiftUI
import CoreLocation

struct NewPlantView: View {
    @Environment(\.dismiss) var dismiss
    
    @Environment(PlantViewModel.self) var vm
    let location: CLLocation?
    @State private var showCamera = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Take a picture") {
                    Button {
                        showCamera.toggle()
                    } label: {
                        if let image = vm.newPlantImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                        } else {
                            HStack {
                                Image(systemName: "camera.fill")
                                    .foregroundStyle(.middleGreen)
                                    .font(.largeTitle)
                                
                            }
                            .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                            .foregroundStyle(.blue)
                        }
                    }
                }
                
                Section("Choose an icon") {
                    emojiPicker
                }
                
                Section("Title") {
//                    TextField("Add a title", text: $vm.newPlantTitle)
                }
                
                Section("Notes") {
//                    TextField("Add notes", text: $vm.newPlantNotes)
                }
            }
            .navigationTitle("Add a new plant")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        vm.createNewPlant(at: location)
                        dismiss()
                    }
                }
            }
            .fullScreenCover(isPresented: $showCamera) {
                CameraView(
                    capturedImage: Binding(
                        get: { vm.newPlantImage },
                        set: { vm.newPlantImage = $0 }
                    ),
                    captureDate: Binding(
                        get: { vm.newPlantDate },
                        set: { vm.newPlantDate = $0 }
                    )
                )
            }
        }
    }
}

#Preview {
    NewPlantView(
                 location: CLLocation(
        latitude: 40.85249838151833,
        longitude: 14.256114949101962))
    .environment(PlantViewModel())
}

extension NewPlantView {
    private var emojiPicker: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(vm.emojiOptions, id: \.self) { emoji in
                    Button(action: {
                        vm.selectedEmoji = emoji
                    }) {
                        Text(emoji)
                            .font(.title)
                            .padding(10)
                            .background(
                                Circle()
                                    .stroke(vm.selectedEmoji == emoji ?
                                        .lightGreen : Color.clear, lineWidth: 4)
                            )
                    }
                }
                
                Button {
                    // Open all emojis
                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.darkGreen)
                        .font(.title)
                        .padding(7)
                        .background(
                            Circle()
                                .stroke(.darkGreen, lineWidth: 4)
                        )
                }
            }
            .padding(5)
        }
    }
}
