import 'package:flutter/cupertino.dart';
import 'package:uno_game/model/uno_game.dart';
import 'package:uno_game/model/uno_hand.dart';

import '../view/custom_widget/uno_card_widget.dart';

enum CardSymbol {
  zero,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  drawTwo,
  drawFour,
  skipTurn,
  changeColor,
  switchPlay,
}

enum CardColor {
  yellow,
  red,
  blue,
  green,
  colorless,
}

enum CardAction {
  none,
  drawTwo,
  drawFour,
  skipTurn,
  switchPlay,
  changeColor,
}

class UnoCard {
  final CardSymbol symbol;
  final CardColor color;
  final CardAction action;
  final int value;
  UnoHand? hand;
  late UnoGame game;
  late bool isHidden;

  UnoCard({
    required this.symbol,
    required this.color,
    required this.action,
    required this.value,
    this.isHidden = true,
  });

  void flipCard() {
    isHidden = !isHidden;
  }

  bool isPlayable(UnoCard card) {
    if (symbol == CardSymbol.changeColor) return true;
    if (symbol == CardSymbol.drawFour) {
      return (color == game.currentColor) || (color == CardColor.colorless);
    }
    return (color == card.color || symbol == card.symbol);
  }

  bool canAccept(UnoCard card) {
    if (card.color == CardColor.colorless) return true;
    return (game.currentColor == card.color) || (card.symbol == symbol);
  }

  String imageName() {
    String colorName = color.toString().split('.').last.toLowerCase();
    String symbolName = symbol.toString().split('.').last.toLowerCase();
    if (symbolName == "zero") {
      return "lib/static/cards/${colorName}_$symbolName.png";
    }
    return "lib/static/cards/${colorName}_$symbolName.png";
  }

  Widget toWidget() {
    return UnoCardWidget(card: this);
  }
}
