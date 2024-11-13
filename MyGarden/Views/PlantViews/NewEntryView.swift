//
//  NewEntryView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 12/11/24.
//

import SwiftUI
import PhotosUI

struct NewEntryView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var notes: String = ""
    @State private var avatarItem: PhotosPickerItem?
    @State private var libraryImage: Image?
    
    @State private var isShowingOptions = false
    @State private var showCamera = false
    @State private var showPhotoPicker = false
    @State private var capturedImage: UIImage?
    @State private var captureDate: Date?
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Button {
                        isShowingOptions = true
                    } label: {
                        if let image = capturedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                                .clipped()
                        } else if let libraryImage {
                            libraryImage
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                        } else {
                            HStack {
                                Image(systemName: "camera.on.rectangle")
                                    .foregroundStyle(.middleGreen)
                                    .font(.largeTitle)
                            }
                            .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                        }
                    }
                }
                
                Section("Notes") {
                    TextField("Add your notes", text: $notes, axis: .vertical)
                        .lineLimit(5...10)
                }
            }
            .navigationTitle("New Entry")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        
                    }
                }
            }
            .confirmationDialog("Take a picture or select one",
                              isPresented: $isShowingOptions,
                              titleVisibility: .visible) {
                Button("Take a picture") {
                    showCamera = true
                }
                Button("Choose from library") {
                    showPhotoPicker = true
                }
            }
            .fullScreenCover(isPresented: $showCamera) {
                CameraView(capturedImage: $capturedImage,
                          captureDate: $captureDate)
            }
            .photosPicker(isPresented: $showPhotoPicker,
                         selection: $avatarItem,
                         matching: .images)
            .onChange(of: avatarItem) {
                Task {
                    if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                        libraryImage = loaded
                    } else {
                        print("Failed to load image")
                    }
                }
            }
        }
    }
}

#Preview {
    NewEntryView()
}
