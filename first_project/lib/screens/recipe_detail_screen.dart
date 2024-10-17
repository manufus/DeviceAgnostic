import 'package:flutter/material.dart';
import '../widgets/responsive_widget.dart';
import '../widgets/custom_vertical_card.dart';
import '../data/cards_data.dart';
import 'package:get/get.dart';

class RecipeDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var recipeId = int.parse(Get.parameters['recipeId']!);
    // int recipeId = 1; 
    final recipe = recipeList.firstWhere((recipe) => recipe['id'] == recipeId);

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe["name"]),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the recipe image
            Image.asset(recipe["image"], fit: BoxFit.cover),

            SizedBox(height: 16),

            // Display the recipe description
            Text(
              recipe["description"],
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 24),

            // Display the list of ingredients
            Text(
              'Ingredients',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: recipe["ingredients"].map<Widget>((ingredient) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text("${ingredient['amount']} ${ingredient['name']}"),
                );
              }).toList(),
            ),

            SizedBox(height: 24),

            // Display the list of steps
            Text(
              'Steps',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: recipe["steps"].map<Widget>((step) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Step Image
                    Image.asset(step["image"], fit: BoxFit.cover),

                    SizedBox(height: 8),

                    // Step Title
                    Text(
                      step["title"],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),

                    // Step Description
                    Text(step["description"]),
                    SizedBox(height: 16),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

