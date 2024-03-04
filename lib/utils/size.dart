import 'package:flutter/material.dart';

class AppSize {
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}