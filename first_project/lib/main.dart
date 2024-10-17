import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/discover_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/manage_recipes_screen.dart';
import 'screens/recipe_detail_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var recipeId = Get.parameters["recipeId"];
    return GetMaterialApp(
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=>HomeScreen()),
        GetPage(name: "/discover", page: ()=>DiscoverScreen()),
        GetPage(name: "/favorites", page: ()=>FavoritesScreen()),
        GetPage(name: "/manage", page: ()=>ManageRecipesScreen()),
        GetPage(name: "/recipes/:recipeId", page: ()=>RecipeDetailScreen()),
      ],
      title: 'Recipe Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    // RecipeDetailScreen(),
    HomeScreen(),
    DiscoverScreen(),
    FavoritesScreen(),
    ManageRecipesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My Recipes',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
