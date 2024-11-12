//
//  MainTabView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 12/11/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Tab("Map", systemImage: "map") {
                MapView()
            }
            
            Tab("Flower List", systemImage: "list.bullet") {
                PlantListView()
            }
            
            Tab("Achievements", systemImage: "star") {
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
}
