//
//  MyProgressView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 12/11/24.
//

import SwiftUI

//The number of plants planted by the user should be passed to this view as an Int

struct MyProgressView: View {
    
    @State var numberOfPlants: Int = 4
    
    var body: some View {
        ZStack{
            //Background Color
            Color("BackgroundGreen")
            
            VStack {
                ProgressFlower(plants: numberOfPlants)
                    .padding(.bottom, 10)
                ScoreBubbleView(plants: numberOfPlants)
                HStack{
                    Spacer()
                    ShareButton()
                        .padding()
                }
            }
        }
    }
}

struct ProgressFlower: View {
    
    var plants: Int
    
    var flower: some View{
        ForEach(0..<plants) { index in
            //We alternate between "DarkGreen", "MiddleGreen" and "LightGreen" for each petal of the Progress Flower, we handle this in an if structure
            if index % 2 == 0 {
                RotatedBadgeSymbol(
                    angle: .degrees(Double(index) / Double(plants)) * 360,
                    colorRotatedBadgeSymbol: Color("DarkGreen")
                )
                .opacity(0.7)
            } else if index % 3 == 0 {
                RotatedBadgeSymbol(
                    angle: .degrees(Double(index) / Double(plants)) * 360,
                    colorRotatedBadgeSymbol: Color("MiddleGreen")
                )
                .opacity(0.7)
            } else {
                RotatedBadgeSymbol(
                    angle: .degrees(Double(index) / Double(plants)) * 360,
                    colorRotatedBadgeSymbol: Color("LightGreen")
                )
                .opacity(0.7)
            }
        }
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                flower
                    .scaleEffect(1.0 / 3.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (2.5 / 4.0) * geometry.size.height)
            }
        }
        .frame(width: .infinity, height: 350)
    }
}


struct ShareButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 50)
                .foregroundColor(Color("MiddleGreen"))
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .foregroundStyle(.white)
                .scaledToFit()
                .frame(width: 32, height: 32)
        }
    }
}

struct ScoreBubbleView: View {
    
    var plants: Int = 0
    
    var body: some View {
        //MARK: Score Bubble
        ZStack{
            Circle()
                .frame(width: 166)
                .foregroundColor(Color("MiddleGreen"))
            VStack{
                //Here will be displayed the total amount of plants planted by the user
                Text("\(plants)")
                    .font(.system(size: 80))
                    .minimumScaleFactor(0.01)
                    .frame(maxWidth: 150)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                Text("plants")
                    .font(.system(size: 40))
                    .minimumScaleFactor(0.01)
                    .frame(maxWidth: 166)
                    .foregroundColor(.white)
                    .padding(.top, -70)
            }
            .frame(width: 166, height: 166)
        }
    }
}

#Preview {
    MyProgressView()
}
