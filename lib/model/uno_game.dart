import 'package:uno_game/model/uno_deck.dart';
import 'package:uno_game/model/uno_player.dart';

class UnoGame {
  int numberOfPlayer;
  List<UnoPlayer>? player;
  UnoDeck? deck;

  UnoGame({this.numberOfPlayer = 4});
}
