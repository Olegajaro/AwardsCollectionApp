//
//  AwardsView.swift
//  AwardsCollectionApp
//
//  Created by Олег Федоров on 15.11.2021.
//

import SwiftUI

struct AwardsView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    GradientRectangles()
                        .frame(width: 200, height: 200)
                    
                    PathView()
                        .frame(width: 200, height: 200)
                    
                    CurvesView()
                        .frame(width: 200, height: 200)
                    
                    GuitarView()
                        .frame(width: 200, height: 400)
                }
            }
            .navigationTitle("Awards")
        }
    }
}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}
