

import 'dart:math';
import 'dart:ui';
import 'package:spritewidget/spritewidget.dart';
import 'package:swurdle_flutter/board.dart';
import 'package:swurdle_flutter/flutter_interface.dart';
import 'package:swurdle_flutter/game_hexagon.dart';
import 'package:swurdlelogic/swurdlelogic.dart' as SL;

class ArrowVector extends NodeWithSize {
  final FlutterInterface ui;

  final SL.Word word;
  final Board board;

  double homeX;
  double homeY;

  Sprite base;
  List<Sprite> segments = new List();
  Sprite head;

  ArrowVector(this.ui, this.board,  this.word) : super(null){

    position = board.identifyHexFromTile(word.tiles.first).position;

    addChild(Circle(30, SL.Board.COLOR_RED));


  }





}

class Circle extends Node {
  Circle(this.radius, this.color);

  int color;
  double radius;

  @override
  void paint(Canvas canvas) {
    canvas.drawCircle(
        Offset.zero,
        radius,
        new Paint()..color = const Color(0xffff0000)
    );
  }
}