import 'package:flutter/material.dart';

class CustomVerticalCard extends StatelessWidget{

  final String title;
  final String subtitle;
  final String image;

  const CustomVerticalCard({
    required this.title,
    required this.subtitle,
    required this.image,
  }
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(title),
          Text(subtitle),
          Image.asset(image)
        ],
      ),
    );
  }
}