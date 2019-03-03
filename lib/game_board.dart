

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:swurdle_flutter/flutter_interface.dart';
import 'package:swurdle_flutter/game_hexagon.dart';
import 'package:swurdlelogic/swurdlelogic.dart';
import 'package:spritewidget/spritewidget.dart';


class GameBoard extends StatefulWidget {

  static const VERTICAL_SIZE = 800.0;
  static const HORIZONTAL_SIZE = 600.0;

  final Position position;
  final bool portrait;
  final FlutterInterface ui;

  GameBoard(this.ui, this.position, this.portrait);

  @override
  GameBoardState createState() => new GameBoardState(ui, position, portrait);
}

class GameBoardState extends State<GameBoard> {
  NodeWithSize rootNode;

  final bool portrait;
  final Position position;
  final FlutterInterface ui;

  GameBoardState(this.ui,this.position, this.portrait){
  }

  @override
  void initState() {
    super.initState();

    rootNode = new NodeWithSize(const Size(GameBoard.HORIZONTAL_SIZE, GameBoard.VERTICAL_SIZE));

    Node backGround = new Sprite(ui.sprites['baize.png'])
    ..scale = 2.5;

    rootNode.addChild(backGround );

    position.tiles.forEach((t)=> rootNode.addChild(new Hexagon(ui, position, t, portrait)));

  }

  @override
  Widget build(BuildContext context) {
    return new SpriteWidget(rootNode);
  }

}