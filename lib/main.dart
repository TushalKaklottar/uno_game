import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uno_game/utils/routes.dart';


void main() {
  runApp(const UNO());
}

class UNO extends StatelessWidget {
  const UNO({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UNO Game',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: Routes.splashRoute(),
      getPages: Routes.routes,
    );
  }
}
