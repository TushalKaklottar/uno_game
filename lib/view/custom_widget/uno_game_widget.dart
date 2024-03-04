import 'package:flutter/material.dart';

class UnoGameWidget extends StatefulWidget {
  const UnoGameWidget({super.key});

  @override
  State<UnoGameWidget> createState() => _UnoGameWidgetState();
}

class _UnoGameWidgetState extends State<UnoGameWidget> {

  UnoGame unoGame;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          bottom: 0,
          right: 0,
            child: Image.asset("assets/images/background.jpeg"),
        ),
        Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                  padding: EdgeInsets.only(top: 5),
                child: Container(
                  height: 460,
                  width: 880,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: ,
                      )
                    ],
                  ),
                ),
              ),
            )
        )
      ],
    );
  }
}
