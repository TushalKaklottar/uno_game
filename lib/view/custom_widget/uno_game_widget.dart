// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:uno_game/view/custom_widget/player_widget.dart';
// import '../../utils/size.dart';
// import '../../view_model/uno_controller.dart';
//
// class UnoGameWidget extends StatefulWidget {
//   const UnoGameWidget({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<UnoGameWidget> createState() => _UnoGameWidgetState();
// }
//
// // click reverse button
// class _UnoGameWidgetState extends State<UnoGameWidget>
//     with TickerProviderStateMixin {
//   final UnoController _unoController = Get.put(UnoController());
//
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//
//   // late Timer _playerTimer;
//   // final List<String> _player = [
//   //   // done
//   //   'player 1',
//   //   'player 2',
//   //   'player 3',
//   //   'player 4',
//   // ];
//
//   // int _currentPlayerIndex = 0; // done
//   // final bool _isReverse = false; // done
//
//   @override
//   void initState() {
//     super.initState();
//     // _startPlayerTimer();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );
//     _animation =
//         Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
//           ..addListener(() {
//             setState(() {});
//           });
//   }
//
//   @override
//   void dispose() {
//     // _playerTimer.cancel();
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   // void _startPlayerTimer() {
//   //   _playerTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
//   //     _changePlayer();
//   //   });
//   // }
//
//   // void _changePlayer() {
//   //   // done
//   //   setState(() {
//   //     _currentPlayerIndex = _isReverse
//   //         ? (_currentPlayerIndex - 1) % _player.length
//   //         : (_currentPlayerIndex + 1) % _player.length;
//   //   });
//   // }
//
//   void _showReverseAnimation() {
//     _animationController.reset();
//     _animationController.forward();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = AppSize.screenSize(context);
//     return Scaffold(
//       body: Stack(
//         children: [
//           Image.asset(
//             "assets/images/background.jpeg",
//             fit: BoxFit.cover,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     TextButton(
//                         onPressed: () {
//                           _unoController.toggleReverse();
//                           if (_unoController.isReverse.value) {
//                             _unoController.reversePlayerIndex();
//                             _showReverseAnimation();
//                           }
//                           // setState(() {
//                           //   _isReverse = !_isReverse;
//                           //   if (_isReverse) {
//                           //     _showReverseAnimation();
//                           //     _currentPlayerIndex =
//                           //         _player.length - 1 - _currentPlayerIndex;
//                           //   }
//                           // });
//                         },
//                         child: const Text("Reverse Card")),
//                     SizedBox(
//                       width: size.width / 3.4,
//                     ),
//                     Obx(() => PlayerWidget(
//                           playerName: "1",
//                           isActive:
//                               _unoController.currentPlayerIndex.value == 0,
//                         )),
//                     // PlayerWidget(
//                     //   playerName: "1",
//                     //   isActive: _currentPlayerIndex == 0,
//                     // ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Obx(() => PlayerWidget(
//                           playerName: "2",
//                           isActive:
//                               _unoController.currentPlayerIndex.value == 1,
//                         )),
//                     // PlayerWidget(
//                     //   playerName: "2",
//                     //   isActive: _currentPlayerIndex == 1,
//                     // ),
//                     Opacity(
//                       opacity: _animation.value,
//                       child: Transform.translate(
//                           offset: Offset(0.0, -20 * (1 - _animation.value)),
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 10, horizontal: 20),
//                             decoration: BoxDecoration(
//                               color: Colors.red,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: const Text(
//                               "Player order reversed!",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           )),
//                     ),
//                     Obx(() => PlayerWidget(
//                           playerName: "4",
//                           isActive:
//                               _unoController.currentPlayerIndex.value == 3,
//                         )),
//                     // PlayerWidget(
//                     //   playerName: "4",
//                     //   isActive: _currentPlayerIndex == 3,
//                     // ),
//                   ],
//                 ),
//                 Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//                   TextButton(
//                       onPressed: () {
//                         _unoController.skipPlayer();
//                         // setState(() {
//                         //   int skipIndex =
//                         //       (_currentPlayerIndex + 2) % _player.length;
//                         //   _currentPlayerIndex = skipIndex;
//                         // });
//                       },
//                       child: const Text("Skip Card")),
//                   SizedBox(
//                     width: size.width / 3,
//                   ),
//                   Obx(() => PlayerWidget(
//                         playerName: "3",
//                         isActive: _unoController.currentPlayerIndex.value == 2,
//                       )),
//                   // PlayerWidget(
//                   //   playerName: "3",
//                   //   isActive: _currentPlayerIndex == 2,
//                   // ),
//                 ]),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../model/uno_card.dart';
import '../../model/uno_game.dart';
import 'dart:math' as math;

class UnoGameWidget extends StatefulWidget {
  const UnoGameWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UnoGameWidget> createState() => _UnoGameWidgetState();
}

class _UnoGameWidgetState extends State<UnoGameWidget> {
  // getx convert
  late UnoGame game;
  @override
  void initState() {
    super.initState();
    initGame();
  }

  void initGame() {
    setState(() {
      game = UnoGame();
      game.prepareGame();
      game.playTurn(this);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = AppSize.screenSize(context);
    game.calculateScores();
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/images/background.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          bottom: 0,
          right: 0,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: game.players[1].hand.toWidget(),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            game.players[2].hand.toWidget(),
                            playTable(context),
                            game.players[0].hand.toWidget(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: game.players[3].hand.toWidget(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget playTable(context) {
    return DragTarget<UnoCard>(onWillAccept: (UnoCard? card) {
      return game.canPlayCard(card!);
    }, onAccept: (UnoCard card) {
      if (game.playCard(card)) {
        game.playTurn(this);
      }
      setState(() {}); // get-x
    }, builder: (context, list1, list2) {
      return SizedBox(
        height: 90,
        width: 250,
        child: playArea(),
      );
    });
  }

  Widget playArea() {
    if (game.isGameOver()) {
      return gameOverWidget();
    } else {
      return cardsAndDeck();
    }
  }

  Widget colorChoice(String title, Color color, CardColor cardColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0, top: 2.0),
      child: SizedBox(
        height: 25,
        child: FloatingActionButton(
          backgroundColor: color,
          child: Text(title),
          onPressed: () {
            print("Human chose: $cardColor");
            game.setColor(cardColor);
            game.playTurn(this);
            setState(() {}); //get-x
          },
        ),
      ),
    );
  }

  Widget gameOverWidget() {
    return Container(
      color: Colors.red.shade400,
      child: Column(
        children: [
          const Text(
            "Game Over !",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                game.playNextRound(); // get-x
              });
            },
            child: const Text("Play again"),
          ),
        ],
      ),
    );
  }

  Widget cardsAndDeck() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Center(
              child: game.currentCard().toWidget(),
            ),
          ),
        ),
        SizedBox(
          height: 30,
          width: 30,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                width: 30,
                height: 30,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(
                    math.pi *
                        (game.turnDirection == TurnDirection.clockwise ? 2 : 1),
                  ),
                  child: Image.asset(
                    "lib/static/images/rotation.png",
                    color: game.getPlayingColor(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: game.needsColorDecision()
                ? SingleChildScrollView(
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          colorChoice("", Colors.red, CardColor.red),
                          colorChoice("", Colors.blue, CardColor.blue),
                          colorChoice("", Colors.yellow, CardColor.yellow),
                          colorChoice("", Colors.green, CardColor.green),
                        ],
                      ),
                    ),
                  )
                : GestureDetector(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 350),
                      child: game.deck.toWidget(),
                    ),
                    onTap: () {
                      if (game.isHumanTurn()) {
                        setState(() {
                          // get-x
                          game.drawCardFromDeck();
                          game.playTurn(this);
                        });
                      } else {
                        print("Not your turn!");
                      }
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
