//
//  MapView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 12/11/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    
    @State private var isShowingNewPlantModal = false
    
    @State private var selectedEmoji = "🌸"


    var body: some View {
        ZStack {
            Map(position: $position) {
//                Annotation("Flower", coordinate: $position) {
//                    MapAnnotationView()
//                }
            }
            .mapControls {
                MapUserLocationButton()
                MapCompass()
                MapScaleView()
            }
            .overlay(alignment: .bottomTrailing) {
                Button {
                    isShowingNewPlantModal.toggle()
                } label: {
                    Image(systemName: "leaf.fill")
                        .font(.title2)
                        .padding()
                        .background(.backgroundGreen)
                        .foregroundStyle(.middleGreen)
                        .clipShape(Circle())
                        .padding()
                }
            }
        }
        .sheet(isPresented: $isShowingNewPlantModal) {
            NewPlantView()
        }
    }
}

#Preview {
    MapView()
}

