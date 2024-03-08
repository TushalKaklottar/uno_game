import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uno_game/utils/color.dart';
import '../../helper/auth_helper.dart';
import '../new_game/new_game_page.dart';

class SingIn extends StatelessWidget {
  const SingIn({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = AppSize.screenSize(context);
    return Scaffold(
      body: Container(
        color: AppColor.yellow3,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      child: Image.asset(
                        "assets/images/google.png",
                      ),
                      onTap: () {
                        AuthHelper.authHelper.singInGoogle().then((_) {
                          Get.off(const NewGame());
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Failed to sign in with Google"),
                            ),
                          );
                        });
                      }),
                  GestureDetector(
                    child: Image.asset("assets/images/guest.png"),
                    onTap: () {
                      AuthHelper.authHelper.loginAnonymously();
                      Get.off(const NewGame());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
