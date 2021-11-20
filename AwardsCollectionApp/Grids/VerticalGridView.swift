//
//  VerticalGridView.swift
//  AwardsCollectionApp
//
//  Created by Олег Федоров on 19.11.2021.
//

import SwiftUI

struct VerticalGridView: View {
    
    let data = (1...100).map { "Item: \($0)" }
    let columns = [
//        GridItem(.adaptive(minimum: 80))
        GridItem(.fixed(70)),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                }
            }
        }
    }
}

struct VerticalGridView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalGridView()
    }
}
