import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  final String recipeId; // This will be passed to identify the selected recipe

  RecipeDetailScreen({required this.recipeId});

  @override
  Widget build(BuildContext context) {
    // For now, we'll just display the recipeId; later, this would be used to fetch details
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recipe ID: $recipeId',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Add more widgets here to show recipe details like title, ingredients, instructions
            Text('Recipe details will go here'),
          ],
        ),
      ),
    );
  }
}
