import 'package:flutter/material.dart';
import 'package:uno_game/view/custom_widget/uno_hand_widget.dart';
import 'package:uno_game/view_model/uno_card.dart';
import 'package:uno_game/view_model/uno_game.dart';
import 'package:uno_game/view_model/uno_player.dart';

import 'enum.dart';

// Enum to represent the orientation of the hand
enum HandOrientation {
  vertical,
  horizontal,
}

// Class representing a player's hand in Uno game
class UnoHand {
  List<UnoCard> cards = []; // List of Uno cards in the hand
  bool isHidden; // Indicates whether the hand is hidden
  HandOrientation
      orientation; // Orientation of the hand (vertical or horizontal)
  UnoGame game; // Reference to the Uno game
  UnoPlayer? player; // Reference to the player who owns the hand

  // Constructor for UnoHand class
  UnoHand({
    required this.cards,
    required this.game,
    this.isHidden = false,
    this.orientation = HandOrientation.horizontal,
  }) {
    // Set the hand reference for each card
    cards = cards.map((card) {
      card.hand = this;
      return card;
    }).toList();
    reorderCards(); // Set the hand reference for each card
  }

  // Reorder the cards in the hand based on color and symbol
  void reorderCards() {
    List<CardColor> myColors = cards.map((c) => c.color).toSet().toList();
    List<UnoCard> orderedCards = [];
    myColors.forEach((_color) {
      List<UnoCard> _coloredCards =
          cards.where((c) => c.color == _color).toList();
      _coloredCards.sort(
          (card1, card2) => card1.symbol.index.compareTo(card2.symbol.index));
      orderedCards.addAll(_coloredCards);
    });
    cards = orderedCards;
  }

  // Remove a card from the hand
  UnoCard? drawCard(UnoCard card) {
    if (cards.contains(card)) {
      cards.remove(card);
      reorderCards();
      return card;
    }
    return null;
  }

  // Add a card to the hand
  void addCard(UnoCard card) {
    card.hand = this;
    card.isHidden = isHidden;
    cards.add(card);
    reorderCards();
  }

  // Get suitable cards that can be played based on the given card
  List<UnoCard> suitableCards(UnoCard card) {
    return cards.where((c) => card.canAccept(c)).toList();
  }

  CardColor getMostColor() {
    var _colors = {};
    cards.forEach((c) {
      _colors[c.color] =
          !_colors.containsKey(c.color) ? 1 : (_colors[c.color] + 1);
    });
    var _actualColors = _colors.keys.toList();
    var _suitableColors =
        _actualColors.where((c) => c != CardColor.colorless).toList();
    if (_suitableColors.isNotEmpty) {
      _suitableColors.shuffle();
      return _suitableColors.first;
    } else {
      var _allColors = CardColor.values;
      _allColors.shuffle();
      return _allColors.first;
    }
  }

  // Play a card from the hand or draw a card if no suitable card is available
  UnoCard? playCardOrDraw(UnoCard card) {
    List<UnoCard> suitable = suitableCards(card);
    if (suitable.isNotEmpty) {
      suitable.shuffle();
      return drawCard(suitable.first);
    }
    return null;
  }

  // Check if the hand orientation is horizontal
  bool isHorizontal() {
    return orientation == HandOrientation.horizontal;
  }

  // Check if the hand orientation is vertical
  bool isVertical() {
    return !isHorizontal();
  }

  // Copy cards from another hand to this hand
  void copyHand(UnoHand hand) {
    emptyHand();
    cards = hand.cards;
  }

  // Empty the hand by removing all cards
  void emptyHand() => cards.clear();

  // Convert the hand to a widget for UI rendering
  Widget toWidget() {
    return UnoHandWidget(
      player: player!,
    );
  }
}
