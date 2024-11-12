//
//  MyProgressView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 12/11/24.
//

import SwiftUI

struct MyProgressView: View {
    var body: some View {
        ZStack{
            //Background Color
            Color("BackgroundGreen")
            //MARK: Score Bubble
            ZStack{
                Circle()
                    .frame(width: 166)
                    .foregroundColor(Color("MiddleGreen"))
                VStack{
                    Text("34")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    MyProgressView()
}
