import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uno_game/view/custom_widget/player_widget.dart';
import '../../utils/size.dart';

class UnoGameWidget extends StatefulWidget {
  UnoGameWidget({Key? key});

  @override
  State<UnoGameWidget> createState() => _UnoGameWidgetState();
}

// click reverse button
class _UnoGameWidgetState extends State<UnoGameWidget>
    with TickerProviderStateMixin {
  late Timer _playerTimer;
  final List<String> _player = [
    'Player 1',
    'Player 2',
    'Player 3',
    'Player 4',
  ];
  int _currentPlayerIndex = 0;

  bool _isReverse = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _startPlayerTimer();
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
    _playerTimer.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _startPlayerTimer() {
    _playerTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      _changePlayer();
    });
  }

  void _changePlayer() {
    setState(() {
      _currentPlayerIndex = _isReverse
          ? (_currentPlayerIndex - 1) % _player.length
          : (_currentPlayerIndex + 1) % _player.length;
    });
  }

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
                          setState(() {
                            _isReverse = !_isReverse;
                            if (_isReverse) {
                              _showReverseAnimation();
                              _currentPlayerIndex =
                                  _player.length - 1 - _currentPlayerIndex;
                            }
                          });
                        },
                        child: const Text("Reverse Card")),
                    SizedBox(
                      width: size.width / 3,
                    ),
                    PlayerWidget(
                      playerName: "1",
                      isActive: _currentPlayerIndex == 0,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PlayerWidget(
                      playerName: "2",
                      isActive: _currentPlayerIndex == 1,
                    ),
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
                            child: Text(
                              "Player order reversed!",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          )),
                    ),
                    // const Text("Central Play Area"),
                    PlayerWidget(
                      playerName: "4",
                      isActive: _currentPlayerIndex == 3,
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          int skipIndex =
                              (_currentPlayerIndex + 2) % _player.length;
                          _currentPlayerIndex = skipIndex;
                        });
                      },
                      child: const Text("Skip Card")),
                  SizedBox(
                    width: size.width / 3,
                  ),
                  PlayerWidget(
                    playerName: "3",
                    isActive: _currentPlayerIndex == 2,
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
