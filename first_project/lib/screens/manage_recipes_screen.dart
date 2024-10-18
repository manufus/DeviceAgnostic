import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/recipe_controller.dart';
import '../widgets/custom_horizontal_card.dart';

class ManageRecipesScreen extends StatelessWidget {
  final RecipeController recipeController = Get.find<RecipeController>(); // Inject the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Recipes'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "Your Favorites" section
            Text(
              'Your Favorites',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Use Obx to observe the changes in the recipe list
            Obx(() {
              // Filter for favorite recipes
              final favoriteRecipes = recipeController.recipeList.where((recipe) {
                return recipe['isFavorite'] == true; // Filter by favorite status
              }).toList();

              // Check if there are favorite recipes
              if (favoriteRecipes.isEmpty) {
                return Center(child: Text('No favorite recipes found.'));
              }

              // Display favorite recipes as horizontal cards
              return Column(
                children: favoriteRecipes.map((recipe) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CustomHorizontalCard(
                      title: recipe['name'],
                      description: recipe['description'],
                      image: recipe['image'],
                    ),
                  );
                }).toList(),
              );
            }),
          ],
        ),
      ),
    );
  }
}
