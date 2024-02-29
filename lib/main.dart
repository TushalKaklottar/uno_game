import 'package:flutter/material.dart';

void main() {
  runApp(const UNO());
}

class UNO extends StatelessWidget {
  const UNO({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UNO Game',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
