//
//  ContentView.swift
//  Desafio-03
//
//  Created by MARCOS FELIPE SOARES ROCHA on 22/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct BookmarkView: View {
    @ObservedObject var bookmarkedDrinks: BookmarkedDrinksViewModel
    @FetchRequest(entity: FavoriteDrink.entity(), sortDescriptors: []) var entitiesFavorited: FetchedResults<FavoriteDrink>

    var body: some View {
        VStack {
            if self.bookmarkedDrinks.grid {
                bookmarkedGridViewFormat(drinks: FavoriteDrinkToBookmarkedModel(entities: entitiesFavorited))
                    .toolbar {
                        Button {
                            self.bookmarkedDrinks.grid = false
                        } label: {
                            Image(systemName: "rectangle.grid.1x2")
                        }
                    }
            } else {
                bookmarkedListViewFormat(drinks: FavoriteDrinkToBookmarkedModel(entities: entitiesFavorited))
                    .toolbar {
                        Button {
                            self.bookmarkedDrinks.grid = true
                        } label: {
                            Image(systemName: "square.grid.2x2")
                        }
                    }
            }
        }.navigationTitle("Bookmarked Drinks")
    }
}

extension BookmarkView {
    
    func FavoriteDrinkToBookmarkedModel(entities: FetchedResults<FavoriteDrink>) -> [BookmarkedModel] {
        var detailsView = [BookmarkedModel]()
        
        entitiesFavorited.forEach { value in
            detailsView.append(BookmarkedModel(
                id: value.drinkId ?? "",
                drinkName: value.drinkName ?? "",
                isAlcoholic: value.isAlcoholic ?? "",
                instructions: "",
                ingredients: [],
                thumb: value.urlImage ?? "")
            )
        }
        
        return detailsView
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DrinksView(viewModel: DrinksViewModel())
//    }
//}
