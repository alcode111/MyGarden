//
//  NewEntryView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 12/11/24.
//

import SwiftUI
import PhotosUI

struct NewEntryView: View {
    @State private var notes: String = ""
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    
    var body: some View {
        NavigationStack {
            Form {
                VStack {
                    PhotosPicker("Select a picture", selection: $avatarItem, matching: .images)
                    
                    avatarImage?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                }
                .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)

                .onChange(of: avatarItem) {
                    Task {
                        if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                            avatarImage = loaded
                        } else {
                            print("Failed")
                        }
                    }
                }
                
                Section("Notes") {
                    TextField("Add your notes", text: $notes)
                }
            }
        }
    }
}

#Preview {
    NewEntryView()
}
