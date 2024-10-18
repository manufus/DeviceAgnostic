import 'package:flutter/material.dart';

class CustomHorizontalCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  CustomHorizontalCard({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Add some padding for better visuals
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image on the left
            Image.asset(
              image,
              width: 100, // Define width to avoid overflow
              height: 100, // Define height to avoid overflow
              fit: BoxFit.cover,
            ),
            // Title and description in the middle
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      description,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
            // Arrow icon on the right
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
