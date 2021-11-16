//
//  GradientRectangles.swift
//  AwardsCollectionApp
//
//  Created by Олег Федоров on 15.11.2021.
//

import SwiftUI

struct GradientRectangles: View {
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            ZStack {
                ForEach(0..<3) { iteration in
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.green, .blue]),
                                startPoint: UnitPoint(x: 0, y: 1),
                                endPoint: UnitPoint(x: 1, y: 0)
                            )
                        )
                        .rotationEffect(.degrees(Double(iteration) * 60))
                        .frame(
                            width: width * 0.7,
                            height: height * 0.7
                        )
                }
                
                Image(systemName: "airplane")
                    .resizable()
                    .rotationEffect(.degrees(-90))
                    .scaleEffect(0.7)
                    .opacity(0.5)
            }
        }
    }
}

struct GradientRectangles_Previews: PreviewProvider {
    static var previews: some View {
        GradientRectangles()
            .frame(width: 200, height: 200)
    }
}
