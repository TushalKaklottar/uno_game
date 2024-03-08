import 'dart:math';
import 'package:flutter/material.dart';
import '../../view_model/uno_card.dart';

class UnoCardWidget extends StatelessWidget {
  const UnoCardWidget({Key? key, required this.card}) : super(key: key);

  final UnoCard card;
  final double cardHeight = 90;
  final double cardWidth = 70;

  @override
  Widget build(BuildContext context) {
    if (card.hand != null && (card.hand?.isVertical() ?? false)) {
      if (card.isHidden) {
        return Transform.rotate(
          angle: 90 * pi / 180,
          child: backFace(),
        );
      } else {
        return Transform.rotate(
          angle: 90 * pi / 180,
          child: frontFace(),
        );
      }
    } else {
      return card.isHidden ? backFace() : frontFace();
    }
  }

  Widget frontFace() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            spreadRadius: 0,
            offset: Offset(-3, 0),
          ),
        ],
      ),
      height: cardHeight,
      width: cardWidth,
      child: Image.asset(
        card.getImageName(),
      ),
    );
  }

  Widget backFace() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      height: cardHeight,
      width: cardWidth,
      child: Image.asset("lib/static/cards/card_back.png"),
    );
  }
}
