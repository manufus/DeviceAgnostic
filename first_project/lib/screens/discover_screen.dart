import 'package:flutter/material.dart';
import '../data/cards_data.dart';
import '../widgets/custom_vertical_card.dart';
import 'package:get/get.dart';
import '../screens/filtered_recipes_screen.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover Cuisines'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cuisines Section
            Text(
              'Explore Cuisines',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: cuisinesData.map<Widget>((cuisine) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to filtered recipe list based on selected cuisine
                    Get.to(() => FilteredRecipesScreen(cuisineName: cuisine['name']!));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CustomVerticalCard(
                      title: cuisine['name']!,
                      subtitle: cuisine['description']!,
                      image: cuisine['image']!,
                    ),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 32), // Spacing between sections

            // Trending Section Header
            Text(
              'Trending',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Trending Recipes List
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: recipeList.map<Widget>((recipe) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to Recipe Detail Page
                      Get.toNamed('/recipes/${recipe['id']}');
                    },
                    child: CustomVerticalCard(
                      title: recipe['name'],
                      subtitle: recipe['description'],
                      image: recipe['image'],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
