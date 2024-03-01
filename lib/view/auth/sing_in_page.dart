import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../helper/auth_helper.dart';
// import '../game_page/game_page.dart';

class SingIn extends StatelessWidget {
  const SingIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/")
                      )
                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Column(

                  ),
              ),
            ],
          )
      ),
    );
  }
}



// body: Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// ElevatedButton(
// onPressed: () {
// AuthHelper.authHelper.singInGoogle().then((_) {
// Get.off(const GamePage());
// }).catchError((error) {
// // print("Error signing in with Google: $error");
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(
// content: Text("Failed to sign in with Google"),
// ),
// );
// }
// );
// },
// child: const Text("SingIn Google"),
// ),
// ElevatedButton(
// onPressed: () {
// AuthHelper.authHelper.loginAnonymously();
// Get.off(const GamePage());
// },
// child: const Text("Guest User"),
// ),
// ],
// ),
// ),