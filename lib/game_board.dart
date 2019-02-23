

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:swurdle_flutter/game_hexagon.dart';
import 'package:swurdlelogic/swurdlelogic.dart';
import 'package:spritewidget/spritewidget.dart';

class GameBoard extends StatefulWidget {

  static const VERTICAL_SIZE = 800.0;
  static const HORIZONTAL_SIZE = 600.0;

  final Position position;

  GameBoard(this.position);

  @override
  GameBoardState createState() => new GameBoardState(position);
}

class GameBoardState extends State<GameBoard> {
  NodeWithSize rootNode;

  Position position;

  GameBoardState(this.position);

  @override
  void initState() {
    super.initState();

    rootNode = new NodeWithSize(const Size(GameBoard.HORIZONTAL_SIZE, GameBoard.VERTICAL_SIZE));

    position.tiles.forEach((t)=> rootNode.addChild(new Hexagon(position, t)));

  }

  @override
  Widget build(BuildContext context) {
    return new SpriteWidget(rootNode);
  }

}