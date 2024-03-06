import 'package:flutter/material.dart';
import 'package:uno_game/model/uno_player.dart';

import '../../model/uno_card.dart';
import '../../model/uno_hand.dart';

class UnoHandWidget extends StatefulWidget {
  const UnoHandWidget({Key? key, required this.player}) : super(key: key);

  final UnoPlayer player;

  @override
  State<UnoHandWidget> createState() => _UnoHandWidgetState();
}

class _UnoHandWidgetState extends State<UnoHandWidget> {
  late double _overlap;
  late double _currentSpace;
  late Size screen;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    print(widget.player.calculateScore());
    return Transform.scale(
      scale:
          widget.player == widget.player.hand.game.currentPlayer() ? 0.9 : 0.75,
      child: Container(
        width: getHandHeight(),
        height: getHandHeight(),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: widget.player.hand.game.isGameOver()
              ? [
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Center(
                      child: Text(
                        "${widget.player.name}\n${widget.player.roundScore} Points",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ]
              : _displayCards(),
        ),
      ),
    );
  }

  List<Widget> _displayCards() {
    _resetValues();
    double top, left;
    return widget.player.hand.cards.map((card) {
      card.isHidden = widget.player.hand.isHidden;
      if (card.hand != null && (card.hand?.isVertical() ?? false)) {
        left = shouldRaiseCard(card) ?? 0;
        top = _currentSpace;
      } else {
        left = _currentSpace;
        top = shouldRaiseCard(card) ?? 0;
      }
      var theCard = AnimatedPositioned(
        duration: const Duration(milliseconds: 350),
        left: left,
        top: top,
        child: Draggable<UnoCard>(
          data: card,
          feedback: card.toWidget(),
          ignoringFeedbackSemantics: false,
          childWhenDragging: Container(),
          child: card.toWidget(),
        ),
      );

      _currentSpace += _overlap;
      return theCard;
    }).toList();
  }

  double? shouldRaiseCard(UnoCard card) {
    return card.game.canPlayCard(card) && !card.isHidden ? 15 : null;
  }

  void _resetValues() {
    int numberOfCards = widget.player.hand.cards.length;
    double handWidth =
        widget.player.hand.orientation == HandOrientation.vertical
            ? getHandHeight()
            : getHandWidth();
    _overlap = (handWidth - 75) / numberOfCards;
    if (_overlap > 50) _overlap = 50;
    _currentSpace = 1;
  }

  double getHandWidth() {
    if (widget.player.hand.orientation == HandOrientation.horizontal) {
      return screen.width > (525 + 150 + 150) ? 525.0 : screen.width / 2;
    } else {
      return 150.0;
    }
  }

  double getHandHeight() {
    if (widget.player.hand.orientation == HandOrientation.vertical) {
      return 420.0;
    } else {
      return 140.0;
    }
  }
}
