import 'package:flutter/material.dart';
import 'package:uno_game/model/uno_card.dart';
import 'package:uno_game/model/uno_game.dart';
import 'package:uno_game/model/uno_player.dart';
import 'package:uno_game/view/custom_widget/uno_hand_widget.dart';

enum HandOrientation {
  vertical,
  horizontal,
}

class UnoHand {
  List<UnoCard> cards = [];
  bool isHidden;
  HandOrientation orientation;
  UnoGame unoGame;
  UnoPlayer player;

  UnoHand(
      {required this.player,
      required this.unoGame,
      this.isHidden = false,
      this.orientation = HandOrientation.horizontal}) {
    this.cards = this.cards.map((card) {
      card.hand = this;
      return card;
    }).toList();
  }
  Widget toWidget() {
    return UnoHandWidget(
      player: this.player,
    );
  }
}
