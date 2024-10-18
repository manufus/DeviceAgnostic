import 'package:flutter/material.dart';
import '../widgets/responsive_widget.dart';
import '../widgets/custom_vertical_card.dart';
import '../data/cards_data.dart';
import '../widgets/custom_horizontal_card.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    

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

 // Mobile Layout with a single scrollable view
Widget _buildMobileLayout(List<Widget> cards, List<Widget> trends, List<Widget> favorites) {
  return Scaffold(
    appBar: AppBar(title: Text('Home (Mobile)')),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome back",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),

          // Favorites Section
          Text(
            "Your Favorites!",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Column(
            children: favorites, // Display all favorite cards inside a Column
          ),
          SizedBox(height: 24),

          // Trends Section
          Text(
            "Latest Trends",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Column(
            children: trends, // Display all trending cards inside a Column
          ),
        ],
      ),
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