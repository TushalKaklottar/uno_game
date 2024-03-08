import 'package:flutter/material.dart';

class AppSize {
  // Method to retrieve the screen size using the provided BuildContext
  static Size screenSize(BuildContext context) {
    // Use MediaQuery to obtain the size of the screen
    return MediaQuery.of(context).size;
  }
}
