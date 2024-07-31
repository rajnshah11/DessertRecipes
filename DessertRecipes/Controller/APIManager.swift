//
//  APIManager.swift
//  DessertRecipes
//
//  Created by Raj Shah on 7/31/24.
//

import Foundation


class APIManager {
    static let shared = APIManager()
    private let baseURL = "https://themealdb.com/api/json/v1/1"

    private init() {}

    func fetchDessertMeals() async throws -> [Meal] {
        let url = URL(string: "\(baseURL)/filter.php?c=Dessert")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MealsResponse.self, from: data)
        return response.meals
    }

    func fetchMealDetail(mealID: String) async throws -> MealDetail {
        let url = URL(string: "\(baseURL)/lookup.php?i=\(mealID)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MealDetailResponse.self, from: data)
        return response.meals.first!
    }
}
