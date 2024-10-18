final List<Map<String, dynamic>> predefinedRecipes = [
  {
    "id": 1,
    "name": "Delicious Pancakes",
    "image": "assets/images/pancakes.jpg",
    "description": "Fluffy and light pancakes, perfect for breakfast.",
    "cuisine": "American",
    "isFavorite": false,
    "isUserCreated": false, // Predefined recipe
    "ingredients": [
      {"name": "Flour", "amount": "2 cups"},
      {"name": "Milk", "amount": "1.5 cups"},
      {"name": "Eggs", "amount": "2 large"},
      {"name": "Baking powder", "amount": "1 tablespoon"},
      {"name": "Salt", "amount": "1/2 teaspoon"},
      {"name": "Sugar", "amount": "2 tablespoons"},
    ],
    "steps": [
      {
        "title": "Prepare the dry ingredients",
        "image": "assets/images/step1.jpg",
        "description": "In a bowl, combine flour, baking powder, salt, and sugar."
      },
      {
        "title": "Mix the wet ingredients",
        "image": "assets/images/step2.jpg",
        "description": "In another bowl, whisk milk and eggs until smooth."
      },
      {
        "title": "Combine and cook",
        "image": "assets/images/step3.jpg",
        "description": "Gradually add the dry ingredients to the wet mixture and stir until smooth. Cook on a hot skillet."
      }
    ]
  },
  {
    "id": 2,
    "name": "Spaghetti Bolognese",
    "image": "assets/images/spaghetti.jpg",
    "description": "A hearty Italian classic that's perfect for dinner.",
    "cuisine": "Italian",
    "isFavorite": true,
    "isUserCreated": false, // Predefined recipe
    "ingredients": [
      {"name": "Spaghetti", "amount": "400g"},
      {"name": "Minced Beef", "amount": "500g"},
      {"name": "Onion", "amount": "1, chopped"},
      {"name": "Tomato Sauce", "amount": "2 cups"},
      {"name": "Garlic", "amount": "2 cloves, minced"},
      {"name": "Olive Oil", "amount": "2 tablespoons"},
    ],
    "steps": [
      {
        "title": "Cook the spaghetti",
        "image": "assets/images/step1_spaghetti.jpg",
        "description": "Cook the spaghetti in a large pot of salted boiling water until al dente."
      },
      {
        "title": "Prepare the sauce",
        "image": "assets/images/step2_spaghetti.jpg",
        "description": "In a pan, sauté onions and garlic in olive oil, then add minced beef and cook until browned."
      },
      {
        "title": "Combine and serve",
        "image": "assets/images/step3_spaghetti.jpg",
        "description": "Mix the cooked spaghetti with the sauce and serve hot."
      }
    ]
  }
  // Add more predefined recipes as needed
];

List<Map<String, dynamic>> filterRecipesByCuisine(String selectedCuisine) {
  return predefinedRecipes.where((recipe) => recipe['cuisine'] == selectedCuisine).toList();
}

List<Map<String, dynamic>> getFavoriteRecipes() {
  return predefinedRecipes.where((recipe) => recipe['isFavorite'] == true).toList();
}

List<Map<String, dynamic>> getUserCreatedRecipes() {
  return predefinedRecipes.where((recipe) => recipe['isUserCreated'] == true).toList();
}

void addRecipe(Map<String, dynamic> newRecipe) {
  newRecipe['id'] = predefinedRecipes.length + 1; // Assign a new unique ID
  newRecipe['isFavorite'] = false; // Default favorite status
  newRecipe['isUserCreated'] = true; // Mark as user-created
  predefinedRecipes.add(newRecipe); // Add the new recipe to the list
}