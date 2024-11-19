//
//  MyProgressView.swift
//  MyGarden
//
//  Created by Ismail Larbi Pacha on 12/11/24.
//

import SwiftUI

struct MyProgressView: View {
    @Environment(PlantViewModel.self) var vm
    
    var body: some View {
        ZStack {
            Color(.backgroundGreen).ignoresSafeArea()
            
            VStack {
                ProgressFlower(plants: vm.plants.count)
                    .padding(.bottom, 10)
                
                ScoreBubbleView(plants: vm.plants.count)
                
                HStack {
                    Spacer()
                    
                    ShareButton()
                        .padding()
                }
            }
        }
    }
}

struct ProgressFlower: View {
    let plants: Int

    @ViewBuilder
    var flower: some View {
        if plants > 0 {
            ForEach(0..<plants, id: \.self) { index in
                if index % 2 == 0 {
                    RotatedBadgeSymbol(
                        angle: .degrees(Double(index) / Double(plants)) * 360,
                        colorRotatedBadgeSymbol: Color(.darkGreen)
                    )
                    .opacity(0.7)
                } else if index % 3 == 0 {
                    RotatedBadgeSymbol(
                        angle: .degrees(Double(index) / Double(plants)) * 360,
                        colorRotatedBadgeSymbol: Color(.middleGreen)
                    )
                    .opacity(0.7)
                } else {
                    RotatedBadgeSymbol(
                        angle: .degrees(Double(index) / Double(plants)) * 360,
                        colorRotatedBadgeSymbol: Color(.lightGreen)
                    )
                    .opacity(0.7)
                }
            }
        } else {
            EmptyView()
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
        .frame(width: .infinity, height: 350) // Fixed .infinity syntax
    }
}

// ShareButton remains the same
struct ShareButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 54, height: 54)
                .foregroundColor(.middleGreen)
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding(.bottom, 4)
                .bold()
                .foregroundStyle(.white)
        }
        .frame(width: 50, height: 50)
    }
}

struct ScoreBubbleView: View {
    let plants: Int
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 166)
                .foregroundColor(.middleGreen)
            VStack {
                Text("\(plants)")
                    .font(.system(size: 80))
                    .minimumScaleFactor(0.01)
                    .frame(maxWidth: 150)
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
            .environment({
                let vm = PlantViewModel()
                vm.plants = PlantViewModel.mockPlants
                return vm
            }())
}

#Preview {
    MyProgressView()
        .environment(PlantViewModel())
}
