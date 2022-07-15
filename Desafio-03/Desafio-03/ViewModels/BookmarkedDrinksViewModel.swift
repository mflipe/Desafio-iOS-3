//
//  BookmarkedDrinksViewModel.swift
//  Desafio-03
//
//  Created by PEDRO GALDIANO DE CASTRO on 23/12/21.
//

import SwiftUI

class BookmarkedDrinksViewModel: ObservableObject {
    @Published var drinks: [DrinkDetails] = []
    @Published var grid:Bool = true
    
    
    init() {
        self.drinks = []
    }
}

