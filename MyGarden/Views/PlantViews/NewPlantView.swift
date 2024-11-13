//
//  NewPlantView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 12/11/24.
//

import SwiftUI

struct NewPlantView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var capturedImage: UIImage?
    @State private var captureDate: Date?
    @State private var showCamera = false
    
    @State private var title: String = ""
    @State private var notes: String = ""
    
    let emojiOptions = ["🌸", "🌹", "🌺", "🌻", "🌼", "🌷", "💐", "🪷", "🍀"]
    @State private var selectedEmoji = "🌸"
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Take a picture") {
                    Button {
                        showCamera.toggle()
                    } label: {
                        if let image = capturedImage {
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
                    TextField("Add a title", text: $title)
                }
                
                Section("Notes") {
                    TextField("Add notes", text: $notes)
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
                        // Function to add new plant
                    }
                }
            }
            .fullScreenCover(isPresented: $showCamera) {
                CameraView(capturedImage: $capturedImage,
                           captureDate: $captureDate)
            }
        }
    }
}

#Preview {
    NewPlantView()
}

extension NewPlantView {
    private var emojiPicker: some View {
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
                                    .stroke(selectedEmoji == emoji ?
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
