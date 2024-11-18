//
//  MyGardenApp.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 12/11/24.
//

import SwiftUI

@main
struct MyGardenApp: App {
    @State var vm = PlantViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .environment(vm)
    }
}
