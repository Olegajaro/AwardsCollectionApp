//
//  BassView.swift
//  AwardsCollectionApp
//
//  Created by Олег Федоров on 15.11.2021.
//

import SwiftUI

struct GuitarView: View {

    var body: some View {
        GeometryReader { geometry in
            let width = min(geometry.size.width, geometry.size.height)
            let height = width * 2
            
            let nearPointX = width * 0.1
            let farPointX = width * 0.9
            let nearPointY = nearPointX
            let farPointY = height - nearPointX
            let middlePointX = width / 2
            let middlePointY = width
            
            // MARK: - Body Guitar
            Path { path in
                path.move(to: CGPoint(x: middlePointX - nearPointX,
                                      y: middlePointY))
                path.addLine(to: CGPoint(x: nearPointX,
                                         y: farPointY - nearPointX * 1.2))
                path.addQuadCurve(
                    to: CGPoint(x: nearPointX * 1.5,
                                y: farPointY),
                    control: CGPoint(x: 0, y: height + nearPointX / 2)
                )
                path.addLine(to: CGPoint(x: middlePointX - nearPointX / 1.5,
                                         y: farPointY - farPointX / 2.5))
                path.addQuadCurve(
                    to: CGPoint(x: middlePointX + nearPointX / 1.5,
                                y: farPointY - farPointX / 2.5),
                    control: CGPoint(x: middlePointX,
                                     y: middlePointY + nearPointX * 4.5)
                )
                path.addLine(to: CGPoint(x: width - nearPointX * 1.5,
                                         y: farPointY))
                path.addQuadCurve(
                    to: CGPoint(x: farPointX,
                                y: farPointY - nearPointX * 1.2),
                    control: CGPoint(x: width, y: height + nearPointX / 2)
                )
                path.addLine(to: CGPoint(x: middlePointX + nearPointX,
                                         y: middlePointY))
            }
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.orange, .red, .yellow]),
                    startPoint: .bottom,
                    endPoint: .top
                )
            )
            
            // MARK: - Neck
            Path { path in
                path.move(to: CGPoint(x: middlePointX - nearPointX / 1.5
                                      , y: middlePointY + farPointX / 5))
                path.addLine(to: CGPoint(x: middlePointX - nearPointX / 1.9,
                                         y: nearPointY + nearPointX))
                path.addLine(to: CGPoint(x: middlePointX + nearPointX / 1.9,
                                         y: nearPointY + nearPointX))
                path.addLine(to: CGPoint(x: middlePointX + nearPointX / 1.5,
                                         y: middlePointY + farPointX / 4))
            }
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [.brown, .black, .black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
            // MARK: - Head
            Path { path in
                path.move(to: CGPoint(x: middlePointX,
                                      y: nearPointY + nearPointX / 2.4))
                path.addLine(to: CGPoint(x: middlePointX - nearPointX * 1.4,
                                         y: 0))
                path.addLine(to: CGPoint(x: middlePointX - nearPointX / 2,
                                         y: nearPointY * 2.5))
                path.addLine(to: CGPoint(x: middlePointX + nearPointX / 1.8,
                                         y: nearPointY * 2.5))
                path.addLine(to: CGPoint(x: middlePointX + nearPointX * 1.4,
                                         y: 0))
            }
            .fill(.orange)
            
            // MARK: - Pick-up
            Path { path in
                path.move(to: CGPoint(x: middlePointX - nearPointX / 1.3,
                                      y: height - width / 1.35))
                path.addLine(to: CGPoint(x: middlePointX - nearPointX / 1.3,
                                         y: height - width / 1.6))
                path.addLine(to: CGPoint(x: middlePointX + nearPointX / 1.3,
                                         y: height - width / 1.6))
                path.addLine(to: CGPoint(x: middlePointX + nearPointX / 1.3,
                                         y: height - width / 1.35))
            }
            
            // MARK: - Tailpiece
            Path { path in
                path.move(to: CGPoint(x: middlePointX - nearPointX / 1.2,
                                      y: height - width / 1.75))
                path.addLine(to: CGPoint(x: middlePointX - nearPointX / 1.2,
                                         y: height - width / 1.9))
                path.addLine(to: CGPoint(x: middlePointX + nearPointX / 1.2,
                                         y: height - width / 1.9))
                path.addLine(to: CGPoint(x: middlePointX + nearPointX / 1.2,
                                         y: height - width / 1.75))
            }
            .fill(Color(white: 0.25))
            
            // MARK: - Controls
            Image(systemName: "seal.fill")
                .resizable()
                .frame(width: nearPointX / 1.5, height: nearPointX / 1.5)
                .offset(x: middlePointX / 0.8, y:  middlePointY / 0.7)
            
            Image(systemName: "seal.fill")
                .resizable()
                .frame(width: nearPointX / 1.5, height: nearPointX / 1.5)
                .offset(x: middlePointX / 0.73, y:  middlePointY / 0.65)
        }
    }
}

struct GuitarView_Previews: PreviewProvider {
    static var previews: some View {
        GuitarView()
            .frame(width: 200, height: 400)
            .previewLayout(.fixed(width: 220, height: 420))
    }
}
