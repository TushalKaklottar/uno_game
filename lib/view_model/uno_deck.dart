import 'package:flutter/cupertino.dart';
import 'package:uno_game/view_model/uno_card.dart';
import 'package:uno_game/view_model/uno_game.dart';
import 'package:uno_game/view_model/uno_hand.dart';

import 'enum.dart';

// Define the UnoDeck class.
class UnoDeck {
  late UnoGame game; // Game instance associated with the deck
  List<UnoCard> cards = []; // List of UnoCards in the deck

  // Method to draw a card from the deck
  UnoCard drawCard({bool hide = false}) {
    UnoCard card = getLastCard(); // Get the last card from the deck
    card.isHidden = hide; // Set the card's hidden status based on the parameter
    return card; // Return the drawn card
  }

  // Method to get the last card from the deck
  UnoCard getLastCard() {
    return cards.removeLast();
  }

// Method to set the game instance associated with the deck
  void setGame(UnoGame theGame) {
    game = theGame; // Set the game instance
    cards = cards.map((c) {
      c.game = game;
      return c;
    }).toList();
  }

  // Method to shuffle the deck
  void shuffle() => cards.shuffle(); // Shuffle the list of cards in the deck

  // Method to deal a hand from the deck
  UnoHand dealHand({
    int cardCount = 7, // Number of cards to deal (default is 7)
    bool isHidden = false,
    bool isHorizontal = true,
  }) {
    if (cards.length > cardCount) {
      List<UnoCard> hand = cards.sublist(0, cardCount);
      cards.removeRange(0, cardCount);
      hand.forEach((c) {
        c.game = game;
      });

      // Determine the orientation of the hand
      var orientation =
          isHorizontal ? HandOrientation.horizontal : HandOrientation.vertical;
      // Return a new UnoHand instance with the dealt cards
      return UnoHand(
        cards: hand,
        isHidden: isHidden,
        orientation: orientation,
        game: game,
      );
    } else {
      // If there are not enough cards in the deck, throw an exception
      throw Exception("Not enough cards in the deck");
    }
  }

  // Constructor for UnoDeck class
  UnoDeck() {
    prepareDeck();
  }

  // Method to prepare the deck by creating cards and shuffling them
  void prepareDeck() {
    // Create cards for each color and add them to the deck
    cards = createCardSet(CardColor.red) +
        createCardSet(CardColor.blue) +
        createCardSet(CardColor.green) +
        createCardSet(CardColor.yellow);
    shuffle();
  }

  // Method to create a set of cards for a specific color
  List<UnoCard> createCardSet(CardColor setColor) {
    // Return a list of UnoCards for the specified color
    return [
      // Define UnoCards for each number and action
      UnoCard(
        symbol: CardSymbol.one,
        color: setColor,
        action: CardAction.none,
        value: 1,
      ),
      UnoCard(
        symbol: CardSymbol.two,
        color: setColor,
        action: CardAction.none,
        value: 2,
      ),
      UnoCard(
        symbol: CardSymbol.three,
        color: setColor,
        action: CardAction.none,
        value: 3,
      ),
      UnoCard(
        symbol: CardSymbol.four,
        color: setColor,
        action: CardAction.none,
        value: 4,
      ),
      UnoCard(
        symbol: CardSymbol.five,
        color: setColor,
        action: CardAction.none,
        value: 5,
      ),
      UnoCard(
        symbol: CardSymbol.six,
        color: setColor,
        action: CardAction.none,
        value: 6,
      ),
      UnoCard(
        symbol: CardSymbol.seven,
        color: setColor,
        action: CardAction.none,
        value: 7,
      ),
      UnoCard(
        symbol: CardSymbol.eight,
        color: setColor,
        action: CardAction.none,
        value: 8,
      ),
      UnoCard(
        symbol: CardSymbol.nine,
        color: setColor,
        action: CardAction.none,
        value: 9,
      ),
      UnoCard(
        symbol: CardSymbol.drawTwo,
        color: setColor,
        action: CardAction.drawTwo,
        value: 20,
      ),
      UnoCard(
        symbol: CardSymbol.skipTurn,
        color: setColor,
        action: CardAction.skipTurn,
        value: 20,
      ),
      UnoCard(
        symbol: CardSymbol.switchPlay,
        color: setColor,
        action: CardAction.switchPlay,
        value: 20,
      ),
      UnoCard(
        symbol: CardSymbol.one,
        color: setColor,
        action: CardAction.none,
        value: 1,
      ),
      UnoCard(
        symbol: CardSymbol.two,
        color: setColor,
        action: CardAction.none,
        value: 2,
      ),
      UnoCard(
        symbol: CardSymbol.three,
        color: setColor,
        action: CardAction.none,
        value: 3,
      ),
      UnoCard(
        symbol: CardSymbol.four,
        color: setColor,
        action: CardAction.none,
        value: 4,
      ),
      UnoCard(
        symbol: CardSymbol.five,
        color: setColor,
        action: CardAction.none,
        value: 5,
      ),
      UnoCard(
        symbol: CardSymbol.six,
        color: setColor,
        action: CardAction.none,
        value: 6,
      ),
      UnoCard(
        symbol: CardSymbol.seven,
        color: setColor,
        action: CardAction.none,
        value: 7,
      ),
      UnoCard(
        symbol: CardSymbol.eight,
        color: setColor,
        action: CardAction.none,
        value: 8,
      ),
      UnoCard(
        symbol: CardSymbol.nine,
        color: setColor,
        action: CardAction.none,
        value: 9,
      ),
      UnoCard(
        symbol: CardSymbol.drawTwo,
        color: setColor,
        action: CardAction.drawTwo,
        value: 20,
      ),
      UnoCard(
        symbol: CardSymbol.skipTurn,
        color: setColor,
        action: CardAction.skipTurn,
        value: 20,
      ),
      UnoCard(
        symbol: CardSymbol.switchPlay,
        color: setColor,
        action: CardAction.switchPlay,
        value: 20,
      ),
      UnoCard(
        symbol: CardSymbol.changeColor,
        color: CardColor.colorless,
        action: CardAction.changeColor,
        value: 50,
      ),
      UnoCard(
        symbol: CardSymbol.drawFour,
        color: CardColor.colorless,
        action: CardAction.drawFour,
        value: 50,
      ),
    ];
  }

  // Method to convert the deck to a widget (representation of the last card)
  Widget toWidget() {
    if (cards.isNotEmpty) {
      return cards.last.toWidget();
    } else {
      return Container();
    }
  }
}
