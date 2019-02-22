



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:swurdlelogic/swurdlelogic.dart';

class Hexagon extends Node {

  final Position pos;
  final Tile tile;

  Hexagon(this.pos, this.tile);

  double radius = 30;

  @override
  void paint(Canvas canvas) {
    canvas.drawCircle(
        Offset.zero,
        radius,
        new Paint()..color = const Color(0xffff0000)

    );
  }
}