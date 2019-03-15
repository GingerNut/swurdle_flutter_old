

import 'dart:math';
import 'dart:ui';
import 'package:spritewidget/spritewidget.dart';
import 'package:swurdle_flutter/board.dart';
import 'package:swurdle_flutter/flutter_interface.dart';
import 'package:swurdle_flutter/game_hexagon.dart';
import 'package:swurdlelogic/swurdlelogic.dart' as SL;

class Arrow extends NodeWithSize {
  final FlutterInterface ui;

  final SL.Word word;
  final Board board;

  double homeX;
  double homeY;

  Sprite base;
  List<Sprite> segments = new List();
  Sprite head;

  Arrow(this.ui, this.board,  this.word) : super(null){

    Hexagon home = board.identifyHexFromTile(word.first);

    homeX = home.homeX;
    homeY = home.homeY;

    position = home.position;

    switch(word.color){

      case SL.Board.COLOR_RED: base = Sprite(ui.sprites['red_arrow_base.png']);
      break;

      case SL.Board.COLOR_BLUE: base = Sprite(ui.sprites['blue_arrow_base.png']);
      break;

      case SL.Board.COLOR_GREY: base = Sprite(ui.sprites['grey_arrow_base.png']);
      break;
    }

    base.scale = Hexagon.defaultScale;
    base.rotation = orientation(word.first, word.tiles[1]);
    addChild(base);

    for(int i = 1 ; i < word.tiles.length -1 ; i ++){

      Sprite segment;

      switch(word.color){

        case SL.Board.COLOR_RED: segment = Sprite(ui.sprites['red_arrow_segment.png']);
        break;

        case SL.Board.COLOR_BLUE: segment = Sprite(ui.sprites['blue_arrow_segment.png']);
        break;

        case SL.Board.COLOR_GREY: segment = Sprite(ui.sprites['grey_arrow_segment.png']);
        break;
      }

      segment.position = offset(word.tiles[i]);
      segment.scale = Hexagon.defaultScale;
      segment.rotation = orientation(word.tiles[i-1], word.tiles[i]);
      addChild(segment);


      segments.add(segment);

    }


    switch(word.color){

      case SL.Board.COLOR_RED: head = Sprite(ui.sprites['red_arrow_head.png']);
      break;

      case SL.Board.COLOR_BLUE: head = Sprite(ui.sprites['blue_arrow_head.png']);
      break;

      case SL.Board.COLOR_GREY: head = Sprite(ui.sprites['grey_arrow_head.png']);
      break;
    }

    head.position = offset(word.last);
    head.scale = Hexagon.defaultScale;
    head.rotation = orientation(word.tiles[word.tiles.length-2], word.tiles.last);

    addChild(head);

  }


  double orientation (SL.Tile first, SL.Tile second){

      Hexagon hexOne = board.identifyHexFromTile(first);
      Hexagon hexTwo = board.identifyHexFromTile(second);

      return acos((hexOne.position.dx - hexTwo.position.dx)/(hexOne.position.dy - hexTwo.position.dy));
  }

  Offset offset(SL.Tile tile){


    Hexagon hex = board.identifyHexFromTile(tile);


    return Offset(hex.homeX - homeX, hex.homeY - homeY);


  }





}