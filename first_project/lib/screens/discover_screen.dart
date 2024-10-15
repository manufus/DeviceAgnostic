import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover Recipes'),
      ),
      body: Center(
        child: Text('Discover new recipes here!'),
      ),
    );
  }
}
