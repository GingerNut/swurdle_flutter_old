

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:swurdle_flutter/game_hexagon.dart';
import 'package:swurdlelogic/swurdlelogic.dart';
import 'package:spritewidget/spritewidget.dart';

class GameBoard extends StatefulWidget {

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


    rootNode = new NodeWithSize(const Size(1024.0, 1024.0));
    rootNode.position = Offset(512, 512);

    Hexagon hexagon = new Hexagon(position, position.tiles[0]);
    hexagon.position = const Offset(-300,0);

    rootNode.addChild(hexagon);
  }

  @override
  Widget build(BuildContext context) {
    return new SpriteWidget(rootNode);
  }

}