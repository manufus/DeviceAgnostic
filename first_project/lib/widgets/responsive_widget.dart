import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;

  const ResponsiveWidget({
    required this.mobile,
    required this.tablet,
  });

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < Breakpoints.sm) {
      return mobile;
    } else if (screenWidth < Breakpoints.md) {
      return tablet;
    } else {
      return tablet; // Fallback for larger screens
    }
  }
}
