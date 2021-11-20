//
//  CustomGrid.swift
//  AwardsCollectionApp
//
//  Created by Олег Федоров on 19.11.2021.
//

import SwiftUI

struct CustomGrid<Content, T1>: View where Content: View {
    
    let items: [T1]
    let columns: Int
    let content: (T1, CGFloat) -> Content
    
    var rows: Int {
        items.count / columns
    }
    
    var body: some View {
        GeometryReader { geometry in
            let sideLength = geometry.size.width / CGFloat(columns)
            
            ScrollView {
                VStack {
                    ForEach(0...rows, id: \.self) { rowIndex in
                        HStack {
                            ForEach(0..<columns) { columnIndex in
                                if let index = indexFor(row: rowIndex, column: columnIndex) {
                                    content(items[index], sideLength)
                                } else {
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func indexFor(row: Int, column: Int) -> Int? {
        let index = row * columns + column
        return index < items.count ? index : nil
    }
    
    
}

struct CustomGrid_Previews: PreviewProvider {
    static var previews: some View {
        CustomGrid(items: [12, 4, 8, 18, 6, 3, 2], columns: 3) { item, size in
            Text("\(item)").frame(width: size, height: size)
        }
    }
}
