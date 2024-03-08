import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../view_model/enum.dart';
import '../../view_model/uno_card.dart';
import '../../view_model/uno_game.dart';

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
      game.playTurn(this); // get-x
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
