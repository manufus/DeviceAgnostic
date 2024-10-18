import 'package:get/get.dart';
import 'package:hive/hive.dart';

class RecipeController extends GetxController {
  var recipeList = <Map<String, dynamic>>[].obs; // Observable list of recipes as maps
  late Box recipeBox;

  @override
  void onInit() {
    super.onInit();
    recipeBox = Hive.box('recipesBox'); // Open the Hive box

    // Load existing recipes from Hive
    loadRecipes();
  }

  // Load all recipes from Hive and add them to the observable list
  void loadRecipes() {
    recipeList.value = recipeBox.values.cast<Map<String, dynamic>>().toList();
  }

  // Add a new recipe to the list and save it to Hive
  void addRecipe(Map<String, dynamic> recipe) {
    recipeList.add(recipe); // Add to observable list
    recipeBox.add(recipe); // Save the recipe to Hive
  }

  // Delete a recipe from the list and remove it from Hive
  void deleteRecipe(int index) {
    recipeBox.deleteAt(index); // Remove from Hive
    recipeList.removeAt(index); // Remove from the observable list
  }
}

