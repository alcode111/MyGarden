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
    @State private var isShowingNewPlantViewModal = false
    @State private var selectedEmoji = "🌸"
    @Environment(PlantViewModel.self) var vm
    @State private var locationManager = LocationManager()
    
    @State private var selectedPlant: Plant?
    @State private var isShowingDetailedPlantView = false
    
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
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            selectedPlant = plant
                                        }
                                    }
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
                    isShowingNewPlantViewModal.toggle()
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
            
            if let plant = selectedPlant {
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedPlant = nil
                        }
                    }
                
                VStack {
                    Spacer()
                    
                    PlantCard(plant: plant, entry: plant.entries.last)
                        .transition(.move(edge: .bottom))
                        .onTapGesture {
                            isShowingDetailedPlantView = true
                        }
                }
                .padding()
            }
            
        }
        .sheet(isPresented: $isShowingNewPlantViewModal) {
            if let currentLocation = locationManager.location {
                NewPlantView(location: currentLocation)
                    .environment(vm)
            } else {
                NewPlantView(location: nil)
                    .environment(vm)
            }
        }
        .sheet(isPresented: $isShowingDetailedPlantView) {
            if let plant = selectedPlant {
                DetailedPlantView(plant: plant, entry: plant.entries.last)
            }
        }
    }
}

#Preview {
    MapView()
        .environment(PlantViewModel())
}

