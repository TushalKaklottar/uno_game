// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:uno_game/view/custom_widget/uno_game_widget.dart';
// import 'package:uno_game/view_model/uno_controller.dart';
//
// import '../../utils/size.dart';
//
// class NewGame extends StatefulWidget {
//   const NewGame({super.key});
//
//   @override
//   State<NewGame> createState() => _NewGameState();
// }
//
// class _NewGameState extends State<NewGame> with SingleTickerProviderStateMixin {
//   // final UnoController unoController = Get.put(UnoController());
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = AppSize.screenSize(context);
//     return Scaffold(
//       body: SafeArea(
//         top: true,
//         left: true,
//         bottom: true,
//         right: true,
//         child: Stack(
//           children: [
//             Positioned.fill(
//               top: 0,
//               left: 0,
//               right: 0,
//               bottom: 0,
//               child: Image.asset(
//                 "assets/images/back.jpeg",
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Positioned(
//                 bottom: size.height / 10 - ((size.height / 2) / 6),
//                 right: size.height / 1.8 - ((size.height / 2) / 1),
//                 child: Container(
//                   width: size.width / 3,
//                   height: size.height / 5,
//                   child: GestureDetector(
//                     onTap: () {
//                       Get.to(() => UnoGameWidget());
//                     },
//                     child: Image.asset("assets/images/new_game.png"),
//                   ),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }
