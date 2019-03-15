


import 'dart:ui';

import 'package:spritewidget/spritewidget.dart';
import 'package:swurdle_flutter/board.dart';
import 'package:swurdle_flutter/flutter_interface.dart';
import 'package:swurdle_flutter/game_hexagon.dart';
import 'package:swurdlelogic/swurdlelogic.dart' as SL;

class Spring extends NodeWithSize {

  final SL.Spring spring;
  final FlutterInterface ui;
  final Board board;
  Hexagon hexagon;

  Sprite sprite;

  Spring(this.board, this.ui, this. spring) : super(null){

    hexagon = board.identifyHexFromTile(spring.tile);

    position = Offset(hexagon.homeX, hexagon.homeY);

    scale = Hexagon.defaultScale;

    setSprite();
  }




  setSprite() {
    switch (spring.player.color) {
      case SL.Board.COLOR_RED:
        sprite = new Sprite(ui.sprites['star_red.png']);
        break;

      case SL.Board.COLOR_BLUE:
        sprite = new Sprite(ui.sprites['star_blue.png']);
        break;

      case SL.Board.COLOR_PURPLE:
        sprite = new Sprite(ui.sprites['star_red.png']);
        break;

      case SL.Board.COLOR_GOLD:
        sprite = new Sprite(ui.sprites['star_red.png']);
        break;
    }

    addChild(sprite);
  }

}