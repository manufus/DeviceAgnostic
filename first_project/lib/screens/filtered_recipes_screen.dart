import 'package:flutter/material.dart';
import '../data/cards_data.dart';
import '../widgets/custom_vertical_card.dart';

class FilteredRecipesScreen extends StatelessWidget {
  final String cuisineName;

  FilteredRecipesScreen({required this.cuisineName});

  @override
  Widget build(BuildContext context) {
    // Filter the recipes by the selected cuisine
    final filteredRecipes = filterRecipesByCuisine(cuisineName);

    return Scaffold(
      appBar: AppBar(
        title: Text('$cuisineName Recipes'),
      ),
      body: ListView.builder(
        itemCount: filteredRecipes.length,
        itemBuilder: (context, index) {
          final recipe = filteredRecipes[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomVerticalCard(
              title: recipe['name'],
              subtitle: recipe['description'],
              image: recipe['image'],
            ),
          );
        },
      ),
    );
  }
}
