//
//  MealListView.swift
//  DessertRecipes
//
//  Created by Raj Shah on 7/31/24.
//

import SwiftUI

struct MealListView: View {
    @StateObject private var viewModel = MealListViewModel()
    @State private var selectedMealID: String?
    var body: some View {
        NavigationView {
            
            List(viewModel.meals, id: \.idMeal) { meal in
                NavigationLink(destination: MealDetailView(mealID: meal.idMeal)) {
                    HStack {
                        AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                        Text(meal.strMeal)
                    }
                   
                }
                .shadow(radius: 5)
                .cornerRadius(10)
            }
            .navigationTitle("Dessert Recipes")
            
            .onAppear {
                Task {
                    await viewModel.loadMeals()
                }
            }
        }
    }
}
