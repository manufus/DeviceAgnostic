import 'package:flutter/material.dart';
import '../widgets/responsive_widget.dart';
import '../widgets/custom_vertical_card.dart';
import '../data/cards_data.dart';
import '../widgets/custom_horizontal_card.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    onTap: () {
  // Navigate to RecipeDetailScreen with a specific recipeId
  Get.toNamed("/recipes/1");  // Example: navigating to recipe with ID 1
};

    final cards = cardsData
        .map(
          (card) => CustomVerticalCard(
            title: card['title']!,
            subtitle: card['subtitle']!,
            image: card['image']!,
          ),
        )
        .toList();

    final favorites = favoritesData
        .map(
          (card) => CustomVerticalCard(
            title: card['title']!,
            subtitle: card['subtitle']!,
            image: card['image']!,
          ),
        )
        .toList(); 

    final trends = trendsData
        .map(
          (card) => CustomHorizontalCard(
            title: card['title']!,
            description: card['description']!,
            image: card['image']!,
          ),
        )
        .toList();     

    return ResponsiveWidget(
      mobile: _buildMobileLayout(cards,trends,favorites),
      tablet: _buildTabletLayout(cards,trends,favorites),
    );
  }

  // Mobile Layout with ListView wrapped in Flexible
  Widget _buildMobileLayout(List<Widget> cards,List<Widget> trends,List<Widget> favorites) {
    return Scaffold(
      appBar: AppBar(title: Text('Home (Mobile)')),
      body: Column(
        children: [
          Text("Welcome back"),
          Text("Your favorites!"),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: favorites,
            ),
          ),
          Text("Latest trends"),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: trends,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTabletLayout(List<Widget> cards,List<Widget> trends,List<Widget> favorites) {
    return Scaffold(
      appBar: AppBar(title: Text('Home (Tablet)')),
      body: Column(
        children: [
          Text("Welcome back (Tablet)"),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: cards,
            ),
          ),
          Text("Latest trends"),
          Flexible(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: trends,
            ),
          )
        ],
      ),
    );
  }
}