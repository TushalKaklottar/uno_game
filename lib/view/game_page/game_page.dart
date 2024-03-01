import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uno_game/view/auth/sing_in_page.dart';
import '../../helper/auth_helper.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    // int _selectedIndex = 0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              AuthHelper.authHelper.singOutGoogle();
              Get.off(const SingIn());
            },
            icon: const Icon(Icons.logout_sharp)
        ),
      ),
    );
  }
}
