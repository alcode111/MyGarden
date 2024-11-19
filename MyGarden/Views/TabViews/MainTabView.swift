//
//  MainTabView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 12/11/24.
//

import SwiftUI

struct MainTabView: View {
    @Environment(PlantViewModel.self) var vm
    
    var body: some View {
        TabView {
            Tab("Map", systemImage: "map") {
                MapView()
            }
            
            Tab("Plant List", systemImage: "list.bullet") {
                PlantListView()
            }
            
            Tab("My Progress", systemImage: "chart.line.uptrend.xyaxis") {
                MyProgressView()
            }
        }
        .onAppear {
                    UITabBar.appearance().scrollEdgeAppearance =
                    UITabBarAppearance()
                }
    }
}

#Preview {
    MainTabView()
        .environment(PlantViewModel())
}
