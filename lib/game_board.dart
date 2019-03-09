

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:swurdle_flutter/board.dart';
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

  GameBoard(this.ui, this.position, this.portrait);

  void invalidate(){

  }

  @override
  GameBoardState createState() => new GameBoardState(ui, position, portrait, hexagons);
}

class GameBoardState extends State<GameBoard> {
  Board board;

  bool valid = true;
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

    board = new Board(hexagons, position, ui);

    Node backGround = new Sprite(ui.sprites['baize.png'])
      ..scale = 2.5;

    board.addChild(backGround );

    position.tiles.forEach((t)=> hexagons. add(new Hexagon(ui, position, t, portrait)));

    hexagons.forEach((h)=> board.addChild(h) );

   draw();
  }

  @override
  void setState(VoidCallback fn){
    super.setState(fn);

    draw();
  }

  void draw(){

    hexagons.forEach((h) => h.redraw());

    valid = true;

    print(ui.game.position.words.length);

  }


  @override
  Widget build(BuildContext context) {
    return new SpriteWidget(board);
  }

}