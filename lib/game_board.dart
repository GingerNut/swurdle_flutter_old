

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


  List<Hexagon> hexagons = new List();

  GameBoard(this.ui, this.position, this.portrait){

  }

  void invalidate(){

  }

  @override
  GameBoardState createState() => new GameBoardState(ui, position, portrait, hexagons);
}

class GameBoardState extends State<GameBoard> {
  NodeWithSize rootNode;

  bool valid = false;
  final bool portrait;
  final Position position;
  final FlutterInterface ui;
  List<Hexagon> hexagons = new List();

  GameBoardState(this.ui,this.position, this.portrait, this.hexagons){
    ui.register(this);
  }

  @override
  void initState() {
    super.initState();

   draw();
  }

  @override
  void setState(VoidCallback fn){
    super.setState(fn);

    draw();
  }

  void draw(){
    rootNode = new NodeWithSize(const Size(GameBoard.HORIZONTAL_SIZE, GameBoard.VERTICAL_SIZE));

    Node backGround = new Sprite(ui.sprites['baize.png'])
      ..scale = 2.5;

    rootNode.addChild(backGround );

    position.tiles.forEach((t)=> hexagons. add(new Hexagon(ui, position, t, portrait)));

    hexagons.forEach((h)=> rootNode.addChild(h));

    valid = true;

  }


  @override
  Widget build(BuildContext context) {
    return new SpriteWidget(rootNode);
  }

}