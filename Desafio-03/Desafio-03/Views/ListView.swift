//
//  ListView.swift
//  Desafio-03
//
//  Created by PEDRO GALDIANO DE CASTRO on 23/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

func listFormat(drinks: [Drink]) -> some View {
    return List(drinks) { drink in
        NavigationLink(destination: DetailsView(drinkId: drink.id)) {
            HStack {
                WebImage(url: URL(string: drink.drinkThumb))
                    .resizable()
                    .placeholder {
                        Rectangle().foregroundColor(.gray)
                    }
                    .indicator(.activity)
                    .scaledToFit()
                    .cornerRadius(35)
                    .frame(width: 70)
                VStack(alignment: .leading) {
                    Text(drink.drink)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                }
            }
        }
    }
}
