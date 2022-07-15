//
//  GridView.swift
//  Desafio-03
//
//  Created by PEDRO GALDIANO DE CASTRO on 23/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

let col = [
    GridItem(.flexible()),
    GridItem(.flexible())
]

func bookmarkedGridViewFormat(drinks: [BookmarkedModel]) -> some View {
    return ScrollView {
        LazyVGrid(columns: col, alignment: .center) {
            ForEach(drinks, id: \.id) { drink in
                NavigationLink(destination: DetailsView(drinkId: drink.id)) {
                    VStack(alignment: .center) {
                        WebImage(url: URL(string: drink.thumb))
                            .resizable()
                            .placeholder {
                                Rectangle().foregroundColor(.gray)
                            }
                            .indicator(.activity)
                            .scaledToFit()
                            .cornerRadius(35)
                            .frame(width: 100)
                            .shadow(color: Color.orange, radius: 9)
                        Text(drink.drinkName)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                    }
                }
            }
        }
    }
}
