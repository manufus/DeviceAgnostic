import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../data/predefined_recipes.dart'; // Import predefined recipes

class RecipeController extends GetxController {
  var recipeList = <Map<String, dynamic>>[].obs; // Observable list of recipes
  late Box recipeBox;

  @override
  void onInit() {
    super.onInit();
    recipeBox = Hive.box('recipesBox'); // Open the Hive box

    // Load both predefined and user-created recipes
    loadRecipes();
  }

  // Load recipes from Hive and combine with predefined recipes
  void loadRecipes() {
    final userCreatedRecipes = recipeBox.values
      .map((recipe) => Map<String, dynamic>.from(recipe as Map))
      .toList();

    // Combine the predefined and user-created recipes
    recipeList.value = [...predefinedRecipes, ...userCreatedRecipes];
  }

  // Add a new recipe to the list and save it to Hive
  void addRecipe(Map<String, dynamic> recipe) {
    recipe['isUserCreated'] = true; // Mark as user-created
    recipeBox.add(recipe); // Save to Hive
    loadRecipes(); // Reload recipes to include the new one
  }

  // Delete a recipe from the list and remove it from Hive (only user-created)
  void deleteRecipe(int index) {
    if (recipeList[index]['isUserCreated'] == true) {
      recipeBox.deleteAt(index - predefinedRecipes.length); // Adjust index for user-created recipes
      loadRecipes(); // Reload recipes after deletion
    }
  }
}

