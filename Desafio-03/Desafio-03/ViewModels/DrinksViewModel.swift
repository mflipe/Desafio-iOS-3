//
//  DrinksViewModel.swift
//  Desafio-03
//
//  Created by Pedro Henrique Calado on 22/12/21.
//

import Foundation

class DrinksViewModel: ObservableObject {
    @Published var grid:Bool = true
    @Published var drinks: [Drink] = []
    let service: API?
    
    init(service: API = CocktailAPI()) {
        self.service = service
        getDrinks()
    }
    
    func getDrinks() {
        service?.getDrinks { response in
            if let drinks = response?.drinks {
                self.drinks = drinks
            }
        }
    }    
}
