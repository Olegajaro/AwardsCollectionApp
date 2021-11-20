//
//  AwardsView.swift
//  AwardsCollectionApp
//
//  Created by Олег Федоров on 15.11.2021.
//

import SwiftUI

struct AwardsView: View {

    let awards = Award.getAwards()
    var activeAwards: [Award] {
        awards.filter { $0.awarded }
    }

    var body: some View {
        NavigationView {
            VStack {
                CustomGrid(items: activeAwards, columns: 2) { award, itemSize  in
                    VStack {
                        award.awardView
                        Text(award.title)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .frame(width: itemSize, height: itemSize)
                }
            }
            .navigationTitle("Your Awards: \(activeAwards.count)")
        }
    }
}


//struct AwardsView: View {
//
//    let awards = Award.getAwards()
//    let columns = [
//        GridItem(.adaptive(minimum: 160, maximum: 200))
//    ]
//    var activeAwards: [Award] {
//        awards.filter { $0.awarded }
//    }
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                LazyVGrid(columns: columns) {
//                    ForEach(activeAwards, id: \.title) { award in
//                        VStack {
//                            award.awardView
//                            Text(award.title)
//                                .font(.title3)
//                                .fontWeight(.semibold)
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Your Awards: \(activeAwards.count)")
//        }
//    }
//}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}
