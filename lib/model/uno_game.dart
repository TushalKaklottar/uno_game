import 'dart:math';
import 'package:flutter/material.dart';
import 'package:uno_game/model/uno_card.dart';
import 'package:uno_game/model/uno_deck.dart';
import 'package:uno_game/model/uno_hand.dart';
import 'package:uno_game/model/uno_player.dart';

// Enum to represent the direction of turns in the game
enum TurnDirection { clockwise, counterclockwise }

// Class representing the Uno game
class UnoGame {
  late int numberOfPlayers;
  late List<UnoPlayer> players;
  late UnoDeck deck;
  late int currentTurn;
  late List<UnoCard> thrown;
  late int winner;
  late TurnDirection turnDirection;
  late CardColor currentColor;

  // Class representing the Uno game
  UnoGame({this.numberOfPlayers = 4});

  // Prepare the game by setting up players, deck, etc.
  void prepareGame() {
    deck = UnoDeck();
    deck.setGame(this);
    players = List.generate(numberOfPlayers, (index) {
      bool hidden = index != 0;
      String name = hidden ? "AI$index" : "Human";
      bool isHorizontal = index == 0 || index == 2;
      UnoHand hand =
          deck.dealHand(isHidden: hidden, isHorizontal: isHorizontal);
      hand.game = this;
      return UnoPlayer(hand: hand, name: name);
    });
    UnoCard firstCard = deck.drawCard();
    firstCard.game = this;
    currentColor = firstCard.color;
    thrown = [firstCard];
    winner = -1;
    turnDirection = TurnDirection.clockwise;
    currentTurn = 0;
    calculateScores();
  }

  // Play the next round of the game
  void playNextRound() {
    deck.prepareDeck();
    players.forEach((player) {
      player.addToGameScore();
      UnoHand hand = deck.dealHand(
          isHidden: player.hand.isHidden,
          isHorizontal: player.hand.isHorizontal());
      hand.game = this;
      hand.player = player;
      player.hand = hand;
    });
    UnoCard firstCard = deck.drawCard();
    firstCard.game = this;
    currentColor = firstCard.color;
    thrown.clear();
    thrown = [firstCard];
    winner = -1;
    turnDirection = TurnDirection.clockwise;
    currentTurn = 0;
    calculateScores();
  }

  // Get the current player
  UnoPlayer currentPlayer() => players[currentTurn];

  // Get the color associated with the current play
  Color? getPlayingColor() {
    switch (currentColor) {
      case CardColor.blue:
        return Colors.blue[600];
      case CardColor.red:
        return Colors.red[600];
      case CardColor.green:
        return Colors.green[600];
      case CardColor.yellow:
        return Colors.yellow[600];
      case CardColor.colorless:
        return Colors.black;
    }
    return Colors.white;
  }

  // Check if a card can be played
  bool canPlayCard(UnoCard card) {
    UnoCard lastCard = currentCard();
    return (currentPlayer() == card.hand?.player) && lastCard.canAccept(card);
  }

  // Play a card in the game
  bool playCard(UnoCard card) {
    print("${card.hand?.player?.name}: ${card.symbol}:${card.color}");
    if (canPlayCard(card)) {
      card.hand?.drawCard(card);
      card.isHidden = false;
      card.hand = null;
      card.game = this;
      thrown.add(card);
      setColor(card.color);
      return doCardAction(card);
    }
    return false;
  }

  // Set the color for the current play
  void setColor(CardColor color) {
    currentColor = color;
  }

  bool needsColorDecision() {
    return currentColor == CardColor.colorless;
  }

  // Perform the action associated with a card
  bool doCardAction(UnoCard card) {
    switch (card.action) {
      case CardAction.skipTurn:
        setNextPlayer(skip: 2);
        return true;
      case CardAction.switchPlay:
        switchPlay();
        setNextPlayer();
        return true;
      case CardAction.drawTwo:
        setNextPlayer();
        drawCardAction();
        drawCardAction();
        setNextPlayer();
        return true;
      case CardAction.drawFour:
        if (isHumanTurn()) {
          print("Human must choose color.");
          setNextPlayer();
          drawCardAction();
          drawCardAction();
          drawCardAction();
          drawCardAction();
          setNextPlayer();
          return false;
        } else {
          var _color = currentPlayer().hand.getMostColor();
          print("Choosing color: $_color");
          setColor(_color);
          setNextPlayer();
          drawCardAction();
          drawCardAction();
          drawCardAction();
          drawCardAction();
          setNextPlayer();
        }
        print("AI chose color.");
        return true;
      case CardAction.changeColor:
        if (isHumanTurn()) {
          print("Human must choose color.");
          setNextPlayer();
          return false;
        } else {
          var _color = currentPlayer().hand.getMostColor();
          print("Choosing color: $_color");
          setNextPlayer();
          setColor(_color);
        }
        print("AI chose color.");
        return true;
      case CardAction.none:
        setNextPlayer();
        return true;
    }
    return true;
  }

  // Get the current card in play
  UnoCard currentCard() {
    return thrown.last;
  }

  // Set the next player in the game
  void setNextPlayer({int skip = 1}) {
    if (turnDirection == TurnDirection.clockwise) {
      currentTurn = ((currentTurn + skip) % numberOfPlayers).round();
    } else {
      currentTurn = ((currentTurn - skip) % numberOfPlayers).round();
    }
    print("Current Turn: $currentTurn");
  }

  // Switch the direction of turns
  void switchPlay() {
    if (turnDirection == TurnDirection.clockwise) {
      turnDirection = TurnDirection.counterclockwise;
    } else {
      turnDirection = TurnDirection.clockwise;
    }
  }

  // Perform a draw card action
  void drawCardAction() {
    UnoCard _card = deck.drawCard(hide: false);
    print("Cards in deck: ${deck.cards.length}");
    _card.game = this;
    currentPlayer().hand.addCard(_card);
  }

  // Draw a card from the deck
  void drawCardFromDeck() {
    print("${currentPlayer().name} is drawing a card.");
    drawCardAction();
    setNextPlayer();
  }

  // Check if the game is over
  bool isGameOver() {
    winner = players.indexWhere((player) => player.hand.cards.isEmpty);
    return winner >= 0;
  }

  // Play a turn in the game
  void playTurn(var state) {
    print("${currentPlayer().name}'s turn...");
    if (!isGameOver()) {
      if (!isHumanTurn()) {
        Random random = Random();
        int seconds = random.nextInt(3) + 2;
        Future.delayed(Duration(seconds: seconds), () {
          UnoCard? _card = currentPlayer().hand.playCardOrDraw(currentCard());
          if (_card == null) {
            drawCardFromDeck();
            playTurn(state);
          } else {
            if (playCard(_card)) playTurn(state);
          }
          state.setState(() {});
        });
      }
    }
  }

  // Calculate scores for players
  void calculateScores() {
    players.map((player) => player.calculateScore());
  }

  bool isHumanTurn() {
    return currentPlayer() == humanPlayer();
  }

  UnoPlayer humanPlayer() {
    return players[0];
  }
}
