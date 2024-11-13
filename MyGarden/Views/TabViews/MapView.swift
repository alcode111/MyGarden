//
//  MapView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 12/11/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var position: MapCameraPosition = .userLocation(fallback: .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 40.83711526053254, longitude: 14.306408393642307), // Example center; replace with your desired fallback
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01) // Adjust zoom level here
            )
        ))
    
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

