import SwiftUI

struct MealDetailView: View {
    @StateObject private var viewModel = MealDetailViewModel()
    let mealID: String

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 16) {
                if let mealDetail = viewModel.mealDetail {
                    VStack(alignment: .center, spacing: 8) {
                        if let imageUrl = URL(string: mealDetail.strMealThumb) {
                            AsyncImage(url: imageUrl) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                            } placeholder: {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            }
                            .frame(height: 250)
                        }
                        
                        Text(mealDetail.strMeal)
                            .font(.title2)  // Smaller font size
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .trailing])
                            .lineLimit(2)  // Limit lines to 2 to prevent overflow
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Instructions:")
                            .font(.headline)
                            .padding(.bottom, 4)
                        
                        Text(mealDetail.strInstructions)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }

                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Ingredients:")
                            .font(.headline)
                            .padding(.bottom, 4)
                        
                        ForEach(mealDetail.filteredIngredients, id: \.ingredient) { item in
                            HStack {
                                Text(item.ingredient)
                                    .font(.body)
                                    .fontWeight(.medium)
                                Spacer()
                                Text(item.measurement)
                                    .font(.body)
                                    .foregroundColor(.gray)
                            }
                            .padding([.leading, .trailing])
                        }
                    }
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                }
            }
            .padding()
            .navigationTitle("Meal Detail")
        }
        .background(LinearGradient(gradient: Gradient(colors: [.white, .gray.opacity(0.1)]), startPoint: .top, endPoint: .bottom))
        .onAppear {
            Task {
                await viewModel.loadMealDetail(mealID: mealID)
            }
        }
    }
}
