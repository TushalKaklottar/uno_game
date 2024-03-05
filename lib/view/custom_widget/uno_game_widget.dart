import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uno_game/view/custom_widget/player_widget.dart';
import '../../utils/size.dart';
import '../../view_model/uno_controller.dart';

class UnoGameWidget extends StatefulWidget {
  const UnoGameWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<UnoGameWidget> createState() => _UnoGameWidgetState();
}

// click reverse button
class _UnoGameWidgetState extends State<UnoGameWidget>
    with TickerProviderStateMixin {
  final UnoController _unoController = Get.put(UnoController());

  late AnimationController _animationController;
  late Animation<double> _animation;

  // late Timer _playerTimer;
  // final List<String> _player = [
  //   // done
  //   'player 1',
  //   'player 2',
  //   'player 3',
  //   'player 4',
  // ];

  // int _currentPlayerIndex = 0; // done
  // final bool _isReverse = false; // done

  @override
  void initState() {
    super.initState();
    // _startPlayerTimer();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void dispose() {
    // _playerTimer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  // void _startPlayerTimer() {
  //   _playerTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
  //     _changePlayer();
  //   });
  // }

  // void _changePlayer() {
  //   // done
  //   setState(() {
  //     _currentPlayerIndex = _isReverse
  //         ? (_currentPlayerIndex - 1) % _player.length
  //         : (_currentPlayerIndex + 1) % _player.length;
  //   });
  // }

  void _showReverseAnimation() {
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = AppSize.screenSize(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background.jpeg",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                        onPressed: () {
                          _unoController.toggleReverse();
                          if (_unoController.isReverse.value) {
                            _unoController.reversePlayerIndex();
                            _showReverseAnimation();
                          }
                          // setState(() {
                          //   _isReverse = !_isReverse;
                          //   if (_isReverse) {
                          //     _showReverseAnimation();
                          //     _currentPlayerIndex =
                          //         _player.length - 1 - _currentPlayerIndex;
                          //   }
                          // });
                        },
                        child: const Text("Reverse Card")),
                    SizedBox(
                      width: size.width / 3.4,
                    ),
                    Obx(() => PlayerWidget(
                          playerName: "1",
                          isActive:
                              _unoController.currentPlayerIndex.value == 0,
                        )),
                    // PlayerWidget(
                    //   playerName: "1",
                    //   isActive: _currentPlayerIndex == 0,
                    // ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx(() => PlayerWidget(
                          playerName: "2",
                          isActive:
                              _unoController.currentPlayerIndex.value == 1,
                        )),
                    // PlayerWidget(
                    //   playerName: "2",
                    //   isActive: _currentPlayerIndex == 1,
                    // ),
                    Opacity(
                      opacity: _animation.value,
                      child: Transform.translate(
                          offset: Offset(0.0, -20 * (1 - _animation.value)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "Player order reversed!",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          )),
                    ),
                    Obx(() => PlayerWidget(
                          playerName: "4",
                          isActive:
                              _unoController.currentPlayerIndex.value == 3,
                        )),
                    // PlayerWidget(
                    //   playerName: "4",
                    //   isActive: _currentPlayerIndex == 3,
                    // ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  TextButton(
                      onPressed: () {
                        _unoController.skipPlayer();
                        // setState(() {
                        //   int skipIndex =
                        //       (_currentPlayerIndex + 2) % _player.length;
                        //   _currentPlayerIndex = skipIndex;
                        // });
                      },
                      child: const Text("Skip Card")),
                  SizedBox(
                    width: size.width / 3,
                  ),
                  Obx(() => PlayerWidget(
                        playerName: "3",
                        isActive: _unoController.currentPlayerIndex.value == 2,
                      )),
                  // PlayerWidget(
                  //   playerName: "3",
                  //   isActive: _currentPlayerIndex == 2,
                  // ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//
// import 'package:flutter/material.dart';
// import '../../model/uno_game.dart';
//
// class UnoGameWidget extends StatefulWidget {
//   const UnoGameWidget({super.key});
//
//   @override
//   State<UnoGameWidget> createState() => _UnoGameWidgetState();
// }
//
// class _UnoGameWidgetState extends State<UnoGameWidget> {
//   late UnoGame game;
//
//   void initGame() {
//     this.setState(() {
//       game = UnoGame();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//             child: Container(
//           height: 460,
//           width: 880,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 alignment: Alignment.topLeft,
//                 child: game.player![0].hand.toWidget(),
//               ),
//             ],
//           ),
//         ))
//       ],
//     );
//   }
// }
