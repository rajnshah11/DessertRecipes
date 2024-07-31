import Foundation

struct MealDetail: Codable {
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String
    let strIngredients: [String?]
    let strMeasurements: [String?]

    enum CodingKeys: String, CodingKey {
        case strMeal
        case strInstructions
        case strMealThumb
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strIngredient16
        case strIngredient17
        case strIngredient18
        case strIngredient19
        case strIngredient20
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
        case strMeasure16
        case strMeasure17
        case strMeasure18
        case strMeasure19
        case strMeasure20
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        
        strIngredients = (1...20).compactMap { index in
            let key = CodingKeys(stringValue: "strIngredient\(index)")!
            let value = try? container.decodeIfPresent(String.self, forKey: key)
            return value?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false ? value : nil
        }
        
        strMeasurements = (1...20).compactMap { index in
            let key = CodingKeys(stringValue: "strMeasure\(index)")!
            let value = try? container.decodeIfPresent(String.self, forKey: key)
            return value?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false ? value : nil
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(strMeal, forKey: .strMeal)
        try container.encode(strInstructions, forKey: .strInstructions)
        try container.encode(strMealThumb, forKey: .strMealThumb)
        
        for (index, ingredient) in strIngredients.enumerated() {
            guard index < 20 else { break }
            let key = CodingKeys(stringValue: "strIngredient\(index + 1)")!
            if let ingredient = ingredient {
                try container.encode(ingredient, forKey: key)
            }
        }
        
        for (index, measurement) in strMeasurements.enumerated() {
            guard index < 20 else { break }
            let key = CodingKeys(stringValue: "strMeasure\(index + 1)")!
            if let measurement = measurement {
                try container.encode(measurement, forKey: key)
            }
        }
    }
    
    var filteredIngredients: [(ingredient: String, measurement: String)] {
        let filteredIngredients = strIngredients.compactMap { $0 }
        let filteredMeasurements = strMeasurements.compactMap { $0 }
        
        let count = min(filteredIngredients.count, filteredMeasurements.count)
        
        return (0..<count).map { index in
            (ingredient: filteredIngredients[index], measurement: filteredMeasurements[index])
        }
    }
}

struct MealDetailResponse: Codable {
    let meals: [MealDetail]
}
