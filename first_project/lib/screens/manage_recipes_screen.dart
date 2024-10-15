import 'package:flutter/material.dart';

class ManageRecipesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Recipes'),
      ),
      body: Center(
        child: Text('Manage your recipe collection here.'),
      ),
    );
  }
}
