import 'package:get/get.dart';
import 'package:uno_game/model/card_model.dart';

class UnoController extends GetxController {

  RxList<CardModel> playerHand = <CardModel>[].obs;
  RxList<CardModel> deck = <CardModel>[].obs;
  Rx<CardModel> topCard = CardModel('', '').obs;

  List<String> colors = ['Red','Blue','Green','yellow'];
  List<String> types = [
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
    'Skip', 'Reverse', 'Draw Two',
  ];


  void playCard(CardModel card) {
    if(isValidMove(card)) {
      topCard.value = card;
      playerHand.remove(card);
      if(playerHand.length == 1) {
      }
    }
  }

  void initializeGame() {
    deck.value = generateDeck();
    deck.shuffle();
    playerHand.value = List.generate(
        7, (_) => drawCardFromDeck() ?? CardModel('',''));
    topCard.value = drawCardFromDeck() ?? CardModel('','');
  }


  List<CardModel> generateDeck() {
    List<CardModel> newDeck = [];
    for (String color in colors) {
      for (String type in types) {
        newDeck.add(CardModel(type, color));
      }
    }
    return newDeck;
  }

  CardModel? drawCardFromDeck() {
    if(deck.isEmpty) return null;
    CardModel drawnCard = deck.removeAt(0);
    return drawnCard;
  }


  bool isValidMove(CardModel card) {
    return card.color == topCard.value.color || card.type == topCard.value.type;
  }

  void drawCard() {
    CardModel? drawnCard = drawCardFromDeck();
    if(drawnCard != null) {
      playerHand.add(drawnCard);
    }
  }
}