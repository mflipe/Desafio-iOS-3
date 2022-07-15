import Foundation

class DrinkDetailsViewModel: ObservableObject {
    var drinkDetails: DrinkDetails = DrinkDetails(id: "",
                                                  drinkName: "",
                                                  isAlcoholic: "",
                                                  instructions: "",
                                                  ingredients: [],
                                                  thumb: "",
                                                  category: "")
    
    let apiService: API
    
    init(drinkId: String, apiService: API = CocktailAPI()) {
        self.apiService = apiService
        self.getDrinkDetails(drinkId: drinkId)
    }
    
    func getDrinkDetails(drinkId: String) {
        apiService.getDrinkDetails(drinkId: drinkId) { response in
            if let drinkDetails = response {
                guard let drinkDetail = drinkDetails.drinks.first else { return }
                
                self.drinkDetails = drinkDetail
            }
        }
    }
    
}
