

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:swurdle_flutter/board.dart';
import 'package:swurdle_flutter/flutter_interface.dart';
import 'package:swurdle_flutter/game_hexagon.dart';
import 'package:swurdle_flutter/game_spring.dart';
import 'package:swurdlelogic/swurdlelogic.dart' as SL;
import 'package:spritewidget/spritewidget.dart';


class GameBoard extends StatefulWidget {

  static const VERTICAL_SIZE = 800.0;
  static const HORIZONTAL_SIZE = 600.0;

  final bool portrait;
  final FlutterInterface ui;


  final List<Hexagon> hexagons = new List();

  GameBoard(this.ui, this.portrait);

  void invalidate(){

  }

  @override
  GameBoardState createState() => new GameBoardState(ui, portrait, hexagons);
}

class GameBoardState extends State<GameBoard> {
  Board board;

  bool valid = true;
  final bool portrait;
  SL.Position get position => ui.game.position;
  final FlutterInterface ui;
  List<Hexagon> hexagons;

  GameBoardState(this.ui,this.portrait, this.hexagons){
    ui.register(this);
  }

  @override
  void initState() {
    super.initState();

    board = new Board(hexagons, position, ui);

    Node backGround = new Sprite(ui.sprites['baize.png'])
      ..scale = 2.5;

    board.addChild(backGround );

    position.tiles.forEach((t)=> hexagons. add(Hexagon(ui, t, portrait)));

    hexagons.forEach((h)=> board.addChild(h) );

    hexagons.forEach((h) => h.initialise());


    valid = true;
  }

  @override
  void setState(VoidCallback fn){
    super.setState(fn);

    draw();
  }

  void draw(){

    hexagons.forEach((h) => h.refresh());

    valid = true;

  }


  @override
  Widget build(BuildContext context) {
    return new SpriteWidget(board);
  }

}