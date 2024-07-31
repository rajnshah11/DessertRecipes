//
//  MealDetailViewModel.swift
//  DessertRecipes
//
//  Created by Raj Shah on 7/31/24.
//
import Foundation

@MainActor
class MealDetailViewModel: ObservableObject {
    @Published var mealDetail: MealDetail?
    @Published var isLoading = false

    func loadMealDetail(mealID: String) async {
        isLoading = true
        do {
            let fetchedMealDetail = try await APIManager.shared.fetchMealDetail(mealID: mealID)
            await MainActor.run {
                self.mealDetail = fetchedMealDetail
                self.isLoading = false
            }
        } catch {
            print("Failed to fetch meal detail: \(error)")
            // Ensure that error handling updates also happen on the main thread
            await MainActor.run {
                self.isLoading = false
            }
        }
    }
}
