import 'package:uno_game/model/uno_hand.dart';

class UnoPlayer {
  UnoHand hand;

  UnoPlayer({required this.hand}) {
    hand.player = this;
  }
}
