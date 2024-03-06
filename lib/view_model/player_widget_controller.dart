// import 'package:get/get.dart';
//
// class PlayerController extends GetxController {
//   RxInt value = 10.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     changeValue();
//   }
//
//   void changeValue() {
//     Future.delayed(
//       const Duration(seconds: 1),
//       () {
//         value.value--;
//         if (value.value <= 0) {
//           value.value = 10;
//         }
//         changeValue();
//       },
//     );
//   }
// }
