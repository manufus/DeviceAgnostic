import 'package:flutter/material.dart';

class CustomHorizontalCard extends StatelessWidget{
  final String title;
  final String description;
  final String image;

  CustomHorizontalCard({
    required this.title,required this.description,required this.image
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(image),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Text(title),
            Text(description),
          ],)
        ],
      ),
    );
  }
}