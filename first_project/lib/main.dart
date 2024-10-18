import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/discover_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/manage_recipes_screen.dart';
import 'screens/recipe_detail_screen.dart';
import 'package:get/get.dart';
import 'screens/add_recipe_screen.dart';
import 'controllers/recipe_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('recipesBox');
  Get.lazyPut<RecipeController>(() => RecipeController());
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
        GetPage(name: "/add-recipe", page: (()=>AddRecipeScreen()))
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
    // FavoritesScreen(),
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
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department),
            label: 'Discover',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.favorite),
          //   label: 'Favorites',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My Recipes',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the AddRecipeScreen
          Get.toNamed("/add-recipe");
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue, // You can set the color to match your theme
      ),
    );
  }
}
