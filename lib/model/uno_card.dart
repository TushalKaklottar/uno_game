// import file and package
import 'package:flutter/cupertino.dart';
import 'package:uno_game/model/uno_game.dart';
import 'package:uno_game/model/uno_hand.dart';
import '../view/custom_widget/uno_card_widget.dart';

// Define an enumeration representing the possible symbols or numbers on Uno cards.
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

// Define an enumeration called CardColor
enum CardColor {
  yellow,
  red,
  blue,
  green,
  colorless,
}

// Define an enumeration called CardAction
enum CardAction {
  none,
  drawTwo,
  drawFour,
  skipTurn,
  switchPlay,
  changeColor,
}

// Define the UnoCard class
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

  // Flips the card to show/hide it.
  void flipCard() {
    isHidden = !isHidden;
  }

  // Checks if the card is playable with another card.
  bool isPlayable(UnoCard otherCard) {
    if (symbol == CardSymbol.changeColor) return true;
    if (symbol == CardSymbol.drawFour) {
      return (color == game.currentColor) || (color == CardColor.colorless);
    }
    return (color == otherCard.color || symbol == otherCard.symbol);
  }

  // Checks if the card can accept another card.
  bool canAccept(UnoCard otherCard) {
    if (otherCard.color == CardColor.colorless) return true;
    return (game.currentColor == otherCard.color) ||
        (otherCard.symbol == symbol);
  }

  // Gets the image name for the card.
  String getImageName() {
    String colorName = color.toString().split('.').last.toLowerCase();
    String symbolName = symbol.toString().split('.').last.toLowerCase();
    if (symbolName == "zero") {
      return "lib/static/cards/${colorName}_$symbolName.png";
    }
    return "lib/static/cards/${colorName}_$symbolName.png";
  }

  // Converts the card to a widget.
  Widget toWidget() {
    return UnoCardWidget(card: this);
  }
}
