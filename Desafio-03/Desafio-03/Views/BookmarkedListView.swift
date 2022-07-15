//
//  ListView.swift
//  Desafio-03
//
//  Created by PEDRO VICTOR PEREIRA MOURA on 23/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

func bookmarkedListViewFormat(drinks: [BookmarkedModel]) -> some View {
    return ScrollView(showsIndicators: false) {
        ForEach(drinks, id: \.id) { drink in
            VStack(alignment: .leading) {
                NavigationLink(destination: DetailsView(drinkId: drink.id)) {
                    HStack {
                        WebImage(url: URL(string: drink.thumb))
                            .resizable()
                            .placeholder {
                                Rectangle().foregroundColor(.gray)
                            }
                            .indicator(.activity)
                            .scaledToFit()
                            .cornerRadius(35)
                            .frame(width: 70)
                        VStack(alignment: .leading) {
                            Text(drink.drinkName)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .padding(.top, 8)
                }
            }
        }
    }
}
