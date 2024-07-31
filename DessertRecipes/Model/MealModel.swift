//
//  MealModel.swift
//  DessertRecipes
//
//  Created by Raj Shah on 7/31/24.
//

import Foundation
struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

struct MealsResponse: Codable {
    let meals: [Meal]
}

