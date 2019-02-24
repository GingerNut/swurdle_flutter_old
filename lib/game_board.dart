

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:swurdle_flutter/game_hexagon.dart';
import 'package:swurdlelogic/swurdlelogic.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:swurdle_flutter/main.dart';

class GameBoard extends StatefulWidget {

  static const VERTICAL_SIZE = 800.0;
  static const HORIZONTAL_SIZE = 600.0;

  final Position position;
  final bool portrait;

  GameBoard(this.position, this.portrait);

  @override
  GameBoardState createState() => new GameBoardState(position, portrait);
}

class GameBoardState extends State<GameBoard> {
  NodeWithSize rootNode;

  final bool portrait;
  final Position position;

  GameBoardState(this.position, this.portrait);

  @override
  void initState() {
    super.initState();

    rootNode = new NodeWithSize(const Size(GameBoard.HORIZONTAL_SIZE, GameBoard.VERTICAL_SIZE));

    rootNode.addChild(new Sprite(sprites['baize.png']));

    position.tiles.forEach((t)=> rootNode.addChild(new Hexagon(position, t, portrait)));

  }

  @override
  Widget build(BuildContext context) {
    return new SpriteWidget(rootNode);
  }

}