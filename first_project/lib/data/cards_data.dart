final List<Map<String, String>> cardsData = [
  {"title": "Chad", "subtitle": "Subtitle 1", "image": "assets/images/chad.png"},
  {"title": "Alice", "subtitle": "Subtitle 2", "image": "assets/images/alice.png"},
  {"title": "Bob", "subtitle": "Subtitle 3", "image": "assets/images/bob.png"},
];

final List<Map<String, String>> favoritesData = [
  {"title": "Favorite Recipe 1", "subtitle": "Subtitle 1", "image": "assets/images/chad.png"},
  {"title": "Favorite Recipe 2", "subtitle": "Subtitle 2", "image": "assets/images/alice.png"},
  {"title": "Favorite Recipe 3", "subtitle": "Subtitle 3", "image": "assets/images/bob.png"},
];

final List<Map<String, String>> trendsData = [
  {"title": "Chad", "description": "Subtitle 1", "image": "assets/images/chad.png"},
  {"title": "Alice", "description": "Subtitle 2", "image": "assets/images/alice.png"},
  {"title": "Bob", "description": "Subtitle 3", "image": "assets/images/bob.png"},
];

final List<Map<String, dynamic>> recipeList = [
  {
    "id": 1,
    "name": "Delicious Pancakes",
    "image": "assets/images/pancakes.jpg",
    "description": "Fluffy and light pancakes, perfect for breakfast.",
    "cuisine": "American",
    "isFavorite": false, // Add a favorite flag
    "isUserCreated": false, // Flag to indicate if the recipe is user-created
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
    "isFavorite": true, // Example of a recipe marked as favorite
    "isUserCreated": false, // Not user-created
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
  },
  // Additional recipes can be added here
];

List<Map<String, dynamic>> filterRecipesByCuisine(String selectedCuisine) {
  return recipeList.where((recipe) => recipe['cuisine'] == selectedCuisine).toList();
}

List<Map<String, dynamic>> getFavoriteRecipes() {
  return recipeList.where((recipe) => recipe['isFavorite'] == true).toList();
}

List<Map<String, dynamic>> getUserCreatedRecipes() {
  return recipeList.where((recipe) => recipe['isUserCreated'] == true).toList();
}

void addRecipe(Map<String, dynamic> newRecipe) {
  newRecipe['id'] = recipeList.length + 1; // Assign a new unique ID
  newRecipe['isFavorite'] = false; // Default favorite status
  newRecipe['isUserCreated'] = true; // Mark as user-created
  recipeList.add(newRecipe); // Add the new recipe to the list
}


final List<Map<String, String>> cuisinesData = [
  {
    "name": "Italian",
    "description": "Explore the rich flavors of Italy with classic pasta, pizza, and more.",
    "image": "assets/images/italian_cuisine.jpg"
  },
  {
    "name": "Mexican",
    "description": "Enjoy the bold and spicy tastes of traditional Mexican cuisine.",
    "image": "assets/images/mexican_cuisine.jpg"
  },
  {
    "name": "Japanese",
    "description": "Savor the delicate and fresh flavors of sushi, ramen, and tempura.",
    "image": "assets/images/japanese_cuisine.jpg"
  },
  {
    "name": "Indian",
    "description": "Dive into the vibrant spices and rich curries of Indian cooking.",
    "image": "assets/images/indian_cuisine.jpg"
  },
  {
    "name": "French",
    "description": "Indulge in the elegance of French cuisine, with pastries, cheese, and wine.",
    "image": "assets/images/french_cuisine.jpg"
  },
  {
    "name": "Thai",
    "description": "Experience the perfect balance of sweet, sour, salty, and spicy in Thai food.",
    "image": "assets/images/thai_cuisine.jpg"
  },
];


