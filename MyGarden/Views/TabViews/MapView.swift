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
    @Environment(PlantViewModel.self) var vm
    @State private var locationManager = LocationManager()
    
    
    var body: some View {
        ZStack {
            Map(position: $position) {
                ForEach(vm.plants) { plant in
                    Annotation(
                        plant.title,
                        coordinate: CLLocationCoordinate2D(
                            latitude: plant.latitude,
                            longitude: plant.longitude)) {
                                MapAnnotationView(emoji: plant.icon)
                            }
                }
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
            if let currentLocation = locationManager.location {
                NewPlantView(location: currentLocation)
                    .environment(vm)
            } else {
                NewPlantView(location: nil)
                    .environment(vm)
            }
        }
    }
}

#Preview {
    MapView()
        .environment(PlantViewModel())
}

