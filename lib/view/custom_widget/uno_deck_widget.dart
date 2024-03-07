import 'package:flutter/cupertino.dart';
import 'package:uno_game/view/custom_widget/uno_card_widget.dart';
import '../../model/uno_deck.dart';

class UnoDeckWidget extends StatefulWidget {
  const UnoDeckWidget({Key? key, required this.deck}) : super(key: key);

  final UnoDeck deck;

  @override
  State<UnoDeckWidget> createState() => _UnoDeckWidgetState();
}

class _UnoDeckWidgetState extends State<UnoDeckWidget> {
  late double _overlap;
  late double _currentSpace;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: _displayCards(),
    );
  }

  List<Widget> _displayCards() {
    return widget.deck.cards.map((card) {
      UnoCardWidget cardWidget = UnoCardWidget(card: card);
      var theCard = AnimatedPositioned(
        duration: const Duration(milliseconds: 350),
        left: _currentSpace,
        child: Draggable<UnoCardWidget>(
          data: cardWidget,
          feedback: cardWidget,
          ignoringFeedbackSemantics: false,
          childWhenDragging: Container(),
          child: cardWidget,
        ),
      );

      _currentSpace += _overlap;
      return theCard;
    }).toList();
  }

  void drawOne() {
    setState(() {
      widget.deck.dealHand(cardCount: 1);
    });
  }
}
