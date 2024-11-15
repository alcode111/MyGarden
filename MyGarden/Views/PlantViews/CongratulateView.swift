//
//  CongratulateView.swift
//  MyGarden
//
//  Created by Luis Mario Recinos Hernádez  on 15/11/24.
//

import SwiftUI

struct CongratulateView: View {
    
    var body: some View {
        VStack{
            Text("You did it!")
                .padding()
            ProgressFlower(plants: 10)
            
            Text("Keep going to watch it grow!")
                .padding(.bottom)
        }
        .background {
            RoundedRectangle(cornerRadius: 40)
                .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    ZStack{
        Color(.gray)
        CongratulateView()
    }
    .ignoresSafeArea()
}
