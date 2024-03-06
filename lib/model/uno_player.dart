import 'package:uno_game/model/uno_hand.dart';

class UnoPlayer {
  UnoHand hand;
  late String name;
  int roundScore = 0;
  int gameScore = 0;

  UnoPlayer({required this.hand, required this.name}) {
    hand.player = this;
  }

  int calculateScore() {
    roundScore = 0;
    hand.cards.forEach((card) {
      roundScore += card.value;
    });
    return roundScore;
  }

  void addToGameScore() {
    gameScore += roundScore;
  }
}
