import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uno_game/utils/color.dart';
import '../auth/sing_in_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear
    );

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 1), () {
          Get.off(const SingIn());
        });
      }
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
      child:   ScaleTransition(
        scale: _animation,
        child: Image.asset(
          "assets/images/uno.png",
          height: 150,
        ),
      ),
     ),
      backgroundColor: AppColor.yellow3,
    );
  }
  @override
  void dispose() {
   _animationController.dispose();
    super.dispose();
  }
}
