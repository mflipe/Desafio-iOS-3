//
//  GridView.swift
//  Desafio-03
//
//  Created by PEDRO GALDIANO DE CASTRO on 23/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

var columns = [
    GridItem(.flexible()),
    GridItem(.flexible())
]

func gridFormat(drinks: [Drink]) -> some View {
    return ScrollView {
        LazyVGrid(columns: columns, alignment: .center) {
            ForEach(drinks, id: \.self) { drink in
                NavigationLink(destination: DetailsView(drinkId: drink.id)) {
                    VStack(alignment: .center) {
                        WebImage(url: URL(string: drink.drinkThumb))
                            .resizable()
                            .placeholder {
                                Rectangle().foregroundColor(.gray)
                            }
                            .indicator(.activity)
                            .scaledToFit()
                            .cornerRadius(35)
                            .frame(width: 100)
                            .shadow(color: Color.orange, radius: 9)
                        Text(drink.drink)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                    }
                }
            }
        }
    }
//    .navigationViewStyle(.stack)
}
