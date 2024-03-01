import 'package:get/get.dart';
import '../view/splash/splash_screen.dart';

class Routes {

  static const String _splash = "/";
  static const String _home = "/home";

  static String splashRoute() => _splash;
  static String homeRoute() => _home;

  static List<GetPage> routes = [
    GetPage(
        name: _splash,
        page: () => const SplashScreen(),
    ),
    // GetPage(
    //     name: _home,
    //     page: () => const HomePage(),
    // ),
  ];
}