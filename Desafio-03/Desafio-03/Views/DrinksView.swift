//
//  ContentView.swift
//  Desafio-03
//
//  Created by MARCOS FELIPE SOARES ROCHA on 22/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DrinksView: View {
    
    @StateObject var viewModel: DrinksViewModel
    @StateObject var bookmarkedDrinks = BookmarkedDrinksViewModel()

        
    var body: some View {
        
        NavigationView {
            if self.viewModel.grid {
                gridFormat(drinks: viewModel.drinks)
                    .navigationTitle("VaiVira")
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing, content:  {
                            
                            NavigationLink(destination: BookmarkView(bookmarkedDrinks: bookmarkedDrinks)) {
                                Image(systemName: "list.star")
                            }
                            
                            Button {
                                self.viewModel.grid = false
                            } label: { Image(systemName: "rectangle.grid.1x2") }
                        })
                    }
                
            } else {
                listFormat(drinks: viewModel.drinks)
                    .navigationTitle("VaiVira")
                
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing, content:  {
                            
                            NavigationLink(destination: BookmarkView(bookmarkedDrinks: bookmarkedDrinks)) {
                                Image(systemName: "list.star")
                            }
                                                       
                            Button {
                                self.viewModel.grid = true
                            } label: { Image(systemName: "square.grid.2x2") }
                        })
                    }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrinksView(viewModel: DrinksViewModel())
    }
}
