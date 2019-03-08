import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:swurdle_flutter/flutter_interface.dart';
import 'package:swurdle_flutter/game_board.dart';
import 'package:swurdle_flutter/game_hexagon.dart';
import 'package:swurdlelogic/swurdlelogic.dart';

class Board extends NodeWithSize{
  final List<Hexagon> hexagons;
  Position pos;
  final FlutterInterface ui;

  Offset pointer;

  bool fingerDown = false;

  Board(this. hexagons, this.pos, this.ui): super(Size(GameBoard.HORIZONTAL_SIZE, GameBoard.VERTICAL_SIZE)){
    userInteractionEnabled = true;
  }



  @override
  bool isPointInside (Offset nodePoint) {

   pointer = nodePoint;
   print(pointer);

   return true;
  }


  @override handleEvent(SpriteBoxEvent event) {
    if (event.type == PointerDownEvent){
        getHex(pointer)?.setBrown();
    }

    else if (event.type == PointerUpEvent){

    }

    else if (event.type == PointerMoveEvent){

      Hexagon h = getHex(pointer);

          if(getHex(pointer) != null) print('finger on ${pos.letters[h.tile.k]}');
    }

    return true;
  }

  Hexagon getHex(Offset offset){
    Hexagon hex;

    hexagons.forEach((h) {
      if(h.isFingerOn(offset)) hex = h;
    });

    if(hex != null) print('found hex with letter ${pos.letters[hex.tile.k]}');

    return hex;
  }


}