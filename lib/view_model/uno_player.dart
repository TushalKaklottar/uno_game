// Represents a player in the Uno game.
import 'package:uno_game/view_model/uno_hand.dart';

class UnoPlayer {
  UnoHand hand; // Hand of cards held by the player
  late String name; // Name of the player
  int roundScore = 0; // Score of the player for the current round
  int gameScore = 0; // Total score of the player across multiple rounds

  // Constructs an instance of UnoPlayer with the given [hand] and [name].
  UnoPlayer({required this.hand, required this.name}) {
    hand.player = this; // Assign this player to the hand
  }

  // Calculates the score for the current round based on the cards in the hand.
  int calculateScore() {
    roundScore = 0;
    for (var card in hand.cards) {
      roundScore += card.value; // Add the value of each card to the round score
    }
    return roundScore;
  }

  // Adds the round score to the total game score.
  void addToGameScore() {
    gameScore += roundScore;
  }
}
