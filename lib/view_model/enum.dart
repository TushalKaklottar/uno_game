// Define an enumeration representing the possible symbols or numbers on Uno cards.
enum CardSymbol {
  zero,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  drawTwo,
  drawFour,
  skipTurn,
  changeColor,
  switchPlay,
}

// Define an enumeration called CardColor
enum CardColor {
  yellow,
  red,
  blue,
  green,
  colorless,
}

enum CardAction {
  none,
  drawTwo,
  drawFour,
  skipTurn,
  switchPlay,
  changeColor,
}
