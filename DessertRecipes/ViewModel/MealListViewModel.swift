//
//  MealListViewModel.swift
//  DessertRecipes
//
//  Created by Raj Shah on 7/31/24.
//

import Foundation

@MainActor
class MealListViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var isLoading = false

    func loadMeals() async {
        isLoading = true
        do {
            let fetchedMeals = try await APIManager.shared.fetchDessertMeals()
            await MainActor.run {
                self.meals = fetchedMeals
                self.isLoading = false
            }
        } catch {
            print("Failed to fetch meals: \(error)")
            // Ensure UI updates happen on the main thread
            await MainActor.run {
                self.isLoading = false
            }
        }
    }
}


