//
//  DetailsView.swift
//  Desafio-03
//
//  Created by PEDRO GALDIANO DE CASTRO on 23/12/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct DetailsView: View {
    @FetchRequest(
        entity: FavoriteDrink.entity(),
        sortDescriptors: []) var favoriteDrinks: FetchedResults<FavoriteDrink>
    
    var drinkId: String {
        didSet {
            self.drinkDetailsViewModel = DrinkDetailsViewModel(drinkId: drinkId)
        }
    }
        
    var drinkDetailsViewModel: DrinkDetailsViewModel
    
    init(drinkId: String) {
        self.drinkId = drinkId
        self.drinkDetailsViewModel = DrinkDetailsViewModel(drinkId: drinkId)
    }
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: drinkDetailsViewModel.drinkDetails.thumb))
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .indicator(.activity)
                .scaledToFit()
                .cornerRadius(35)
                .frame(width: 250)
                .shadow(color: Color.orange, radius: 100)
                .padding(.vertical, 30)
            
            
            HStack(alignment: .top, spacing: 100) {
                VStack(alignment: .center) {
                        Text("Category")
                        .bold()
                        .font(.title2)
                        .padding(.vertical, 0)
                    
                    Text(drinkDetailsViewModel.drinkDetails.category)
                        .padding(.vertical, 1)
                }
                VStack(alignment: .center) {
                    Text("Type")
                        .bold()
                        .font(.title2)
                        .padding(.vertical, 0)

                    Text(drinkDetailsViewModel.drinkDetails.isAlcoholic)
                        .padding(.vertical, 1)
                }
            }
            
//            Divider()
            
            HStack(alignment: . center, spacing: 100) {
                Text("Ingredient")
                    .bold()
                    .font(.title2)
                    .padding(.vertical, 20)
                
                Text("Quantity")
                    .bold()
                    .font(.title2)
                    .padding(.vertical, 20)
            }
    
            Divider()
            Spacer()
            
            ScrollView {
                ForEach(drinkDetailsViewModel.drinkDetails.ingredients, id: \.id) { ingredient in
                    
                    HStack(alignment: .top, spacing: 100) {
                        Text(ingredient.name)
                                .bold()
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                .lineLimit(4)
                                .minimumScaleFactor(0.8)
                                
                                .padding(.top, 3)
                                .frame(width: 100)

                        Text(ingredient.measure)
                                .bold()
                                .font(.callout)
                                .multilineTextAlignment(.center)
                                .lineLimit(4)
                                .minimumScaleFactor(0.8)
                                .padding(.top, 3)
                                .frame(width: 100)
                        }
                    }
                }
            }.padding(30)
            
            .navigationTitle(drinkDetailsViewModel.drinkDetails.drinkName)
            .toolbar {
                if isFavorited(drinkDetailsViewModel.drinkDetails) {
                    Button {
                        PersistenceController.shared.delete(
                            self.searchFavoritedEntity(drinkDetailsViewModel.drinkDetails.id)!
                        )
                    } label : {
                        Image(systemName: "star.fill")
                    }
                } else {
                    Button {
                        let favoriteDrinkEntity = FavoriteDrink(context: PersistenceController.shared.container.viewContext)
                        
                        favoriteDrinkEntity.drinkId = drinkDetailsViewModel.drinkDetails.id
                        favoriteDrinkEntity.drinkName = drinkDetailsViewModel.drinkDetails.drinkName
                        favoriteDrinkEntity.isAlcoholic = drinkDetailsViewModel.drinkDetails.isAlcoholic
                        favoriteDrinkEntity.isFavorite = true
                        favoriteDrinkEntity.urlImage = drinkDetailsViewModel.drinkDetails.thumb
                        favoriteDrinkEntity.category = drinkDetailsViewModel.drinkDetails.category
                        
                        PersistenceController.shared.save()
                        
                    } label : {
                        Image(systemName: "star")
                    }
                }
                
                
            }
    }
}

extension DetailsView {
    func isFavorited(_ drink: DrinkDetails) -> Bool {
        return self.favoriteDrinks.first { $0.drinkId == drink.id } != nil
    }
    
    func searchFavoritedEntity(_ drinkId: String) -> FavoriteDrink? {
        return self.favoriteDrinks.first { $0.drinkId == drinkId }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(drinkId: "29309")
    }
}
