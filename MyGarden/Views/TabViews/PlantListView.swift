//
//  PlantListView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 12/11/24.
//

import SwiftUI

struct PlantListView: View {
    var body: some View {
        NavigationStack{
            
            ZStack {
                Color.backgroundGreen
                ScrollView{
                    
                    VStack{
                        Spacer()
                        PlantCard()
                        PlantCard()
                        PlantCard()
                        PlantCard()
                        PlantCard()
                        PlantCard()
                        PlantCard()
                    }
                }
                .padding(.horizontal,10)
                
                .navigationTitle(Text("My Plants"))
            }
            
        }
      
    }
}

#Preview {
    PlantListView()
}
