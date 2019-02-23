


import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:swurdle_flutter/game_board.dart';
import 'package:swurdlelogic/swurdlelogic.dart';

class Hexagon extends Node {

  final Position pos;
  final Tile tile;
   double hexSize;

  static const lineWidth = 1.5;
  static const spacing = 32.0;
  static const root3over2 = 0.8660254037844;

  double homeX;
  double homeY;

  Hexagon(this.pos, this.tile){
    setVariables();
  }



  @override
  void paint(Canvas canvas) {

    Paint line = new Paint()..color = const Color(0xff1a0d00);
    Paint inside = new Paint()..color = const Color(0xffcc6600);

    Path path = new Path()
      ..moveTo( -1 * hexSize  + homeX, 0 + homeY)
      ..lineTo(-0.5 * hexSize + homeX, root3over2 * hexSize + homeY)
      ..lineTo(0.5 * hexSize + homeX, root3over2 * hexSize  + homeY)
      ..lineTo(1 * hexSize + homeX, 0 + homeY)
      .. lineTo(0.5 * hexSize  + homeX, -root3over2 * hexSize  + homeY)
      .. lineTo(-0.5 * hexSize  + homeX, -root3over2 * hexSize  + homeY)
      ..close();

    canvas.drawPath(path, line );

    path = new Path()
    ..moveTo( -1 * (hexSize - lineWidth) + homeX, 0 + homeY)
    ..lineTo(-0.5 * (hexSize - lineWidth) + homeX, root3over2 * (hexSize - lineWidth) + homeY)
    ..lineTo(0.5 * (hexSize - lineWidth) + homeX, root3over2 * (hexSize - lineWidth)  + homeY)
    ..lineTo(1 * (hexSize - lineWidth) + homeX, 0 + homeY)
    .. lineTo(0.5 * (hexSize - lineWidth)  + homeX, -root3over2 * (hexSize - lineWidth) + homeY )
    .. lineTo(-0.5 * (hexSize - lineWidth)  + homeX, -root3over2 * (hexSize - lineWidth) + homeY )
    ..close();

    canvas.drawPath(path, inside );



  }

  setVariables(){
    const padding = 1.0;
    const horizontal_packing = 0.75;

    hexSize = min(GameBoard.HORIZONTAL_SIZE / size * root3over2 /1.63, GameBoard.VERTICAL_SIZE/ size * root3over2 / 1.45);

    double hexagonSpacingVertical = hexSize * (2 + padding * 2) * root3over2;
    double hexagonSpacingHorizontal = hexSize * (2 + padding * 2) * horizontal_packing;

    double horizontalPadding = (GameBoard.HORIZONTAL_SIZE - hexagonSpacingHorizontal * size)/2;
    double verticalPadding = (GameBoard.VERTICAL_SIZE - hexagonSpacingVertical * size)/2 ;

    homeX = tile.i * hexagonSpacingHorizontal;
    homeY = tile.j * hexagonSpacingVertical;

  }
}