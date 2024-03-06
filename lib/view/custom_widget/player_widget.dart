// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../view_model/player_widget_controller.dart';
//
// class PlayerWidget extends StatefulWidget {
//   final String playerName;
//   final bool isActive;
//   const PlayerWidget(
//       {Key? key, required this.playerName, required this.isActive})
//       : super(key: key);
//
//   @override
//   State<PlayerWidget> createState() => _PlayerWidgetState();
// }
//
// class _PlayerWidgetState extends State<PlayerWidget> {
//   // int value = 10;
//
//   final PlayerController playerController = Get.put(PlayerController());
//
//   // void changeValue() {
//   //   log("CALLED");
//   //   Future.delayed(
//   //     const Duration(seconds: 1),
//   //     () {
//   //       log("Value: $value");
//   //       setState(() {
//   //         value--;
//   //         if (value <= 0) {
//   //           value = 10;
//   //         }
//   //       });
//   //       changeValue();
//   //     },
//   //   );
//   // }
//
//   // @override
//   // void initState() {
//   //   changeValue();
//   //   super.initState();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 50,
//       child: Column(
//         children: [
//           Container(
//             height: 50,
//             width: 50,
//             decoration: BoxDecoration(
//               border: Border.all(),
//               borderRadius: BorderRadius.circular(10),
//               color: widget.isActive ? Colors.green : Colors.white,
//             ),
//             child: Center(
//               child: Text(widget.playerName),
//             ),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Obx(() => Visibility(
//               visible: widget.isActive,
//               child: LinearProgressIndicator(
//                 backgroundColor: Colors.black,
//                 valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
//                 minHeight: 2.5,
//                 value: playerController.value.value / 10,
//               )))
//           // Visibility(
//           //   visible: widget.isActive,
//           //   child: LinearProgressIndicator(
//           //     minHeight: 2,
//           //     value: value / 10,
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
//
// class PlayerStatusWidget extends StatelessWidget {
//   final String playerName;
//   final bool isActive;
//
//   const PlayerStatusWidget({
//     Key? key,
//     required this.playerName,
//     required this.isActive,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       width: 100,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: isActive ? Colors.green : Colors.red,
//       ),
//       child: Text(
//         isActive ? 'Active' : 'Inactive',
//         style: const TextStyle(color: Colors.white),
//       ),
//     );
//   }
// }
