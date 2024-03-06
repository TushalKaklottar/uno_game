// import 'dart:async';
// import 'package:get/get.dart';
//
// class UnoController extends GetxController {
//   late Timer playerTimer;
//   final List<String> players = ['Player 1', 'Player 2', 'Player 3', 'Player 4'];
//   RxInt currentPlayerIndex = 0.obs;
//   RxBool isReverse = false.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     startPlayerTimer();
//   }
//
//   @override
//   void onClose() {
//     playerTimer.cancel();
//     super.onClose();
//   }
//
//   void startPlayerTimer() {
//     playerTimer = Timer.periodic(const Duration(seconds: 9), (_) {
//       changePlayer();
//     });
//   }
//
//   void changePlayer() {
//     isReverse.value
//         ? currentPlayerIndex.value =
//             (currentPlayerIndex.value - 1) % players.length
//         : currentPlayerIndex.value =
//             (currentPlayerIndex.value + 1) % players.length;
//   }
//
//   void toggleReverse() {
//     isReverse.toggle();
//   }
//
//   void reversePlayerIndex() {
//     currentPlayerIndex.value = players.length - 1 - currentPlayerIndex.value;
//   }
//
//   void skipPlayer() {
//     int skipIndex = (currentPlayerIndex.value + 2) % players.length;
//     currentPlayerIndex.value = skipIndex;
//   }
// }
