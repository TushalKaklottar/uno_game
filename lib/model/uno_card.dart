import 'package:uno_game/model/uno_game.dart';
import 'package:uno_game/model/uno_hand.dart';

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
  UnoGame? game;
  bool? isHidden;

  UnoCard(
    this.symbol,
    this.action,
    this.value,
    this.color,
  );

  void flipCard() {
    isHidden = this.isHidden;
  }
}
