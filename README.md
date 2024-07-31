# Dessert Recipes


## Overview
The Dessert Recipes app is a SwiftUI application that allows users to explore a collection of dessert recipes. The app fetches and displays dessert meal details from an API and provides detailed views of each recipe, including instructions and ingredients.

## Features
### Meal List: Displays a list of dessert recipes with images and titles.
### Meal Detail: Provides detailed information about a selected recipe, including instructions and ingredients.
### Asynchronous Data Loading: Utilizes Swift’s concurrency features to fetch data asynchronously.
Endpoint: https://themealdb.com/api/json/v1/1/filter.php?c=Dessert

### Description: Fetches a list of meals in the Dessert category.
### Fetch Meal Details
Endpoint: https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID
Description: Fetches details of a meal by its ID.

## Requirements
Swift Concurrency: Asynchronous code should use Swift Concurrency (async/await).
Filter Null or Empty Values: Ensure any null or empty values from the API are filtered out before displaying them.
Compatibility: The project should compile using the latest version of Xcode.
