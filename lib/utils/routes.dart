import 'package:get/get.dart';
import '../view/custom_widget/uno_game_widget.dart';
import '../view/splash/splash_screen.dart';

class Routes {
  static const String _splash = "/";
  static const String _home = "/home";
  static const String _game = "/home";

  static String splashRoute() => _splash;
  static String homeRoute() => _home;
  static String gameRoute() => _game;

  static List<GetPage> routes = [
    GetPage(
      name: _splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _game,
      page: () => const UnoGameWidget(
        title: '',
      ),
    ),
  ];
}
