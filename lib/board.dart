import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:swurdle_flutter/flutter_interface.dart';
import 'package:swurdle_flutter/game_board.dart';
import 'package:swurdle_flutter/game_hexagon.dart';
import 'package:swurdlelogic/swurdlelogic.dart';

class Board extends NodeWithSize{

  static const Z_HEXAGON = 0.0;
  static const Z_WORD = 1.0;
  static const Z_LETTER = 2.0;



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

   return true;
  }


  @override handleEvent(SpriteBoxEvent event) {
    if (event.type == PointerDownEvent){
      Hexagon h = getHex(pointer);

      if(h != null){

        ui.select(h.tile);
        refreshTiles();
      }

    }

    else if (event.type == PointerUpEvent){


    }

    else if (event.type == PointerMoveEvent){

    }

    return true;
  }

  Hexagon getHex(Offset offset){
    Hexagon hex;

    hexagons.forEach((h) {
      if(h.isPointInside(offset)) hex = h;
    });

    return hex;
  }

  Hexagon identifyHexFromTile(Tile tile) => hexagons[tile.k];

  refreshTiles(){
    hexagons.forEach((h) {
      h.refresh();
    });
  }



}