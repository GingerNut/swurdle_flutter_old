

import 'dart:math';
import 'package:spritewidget/spritewidget.dart';
import 'package:swurdle_flutter/board.dart';
import 'package:swurdle_flutter/flutter_interface.dart';
import 'package:swurdle_flutter/game_hexagon.dart';
import 'package:swurdlelogic/swurdlelogic.dart' as SL;

class Arrow extends NodeWithSize {
  final FlutterInterface ui;

  final SL.Word word;
  final Board board;

  Sprite base;
  List<Sprite> segments = new List();
  Sprite head;

  Arrow(this.ui, this.board,  this.word) : super(null){

    switch(word.color){

      case SL.Board.COLOR_RED: base = new Sprite(ui.sprites['red_arrow_base.png']);
      break;

      case SL.Board.COLOR_BLUE: base = new Sprite(ui.sprites['blue_arrow_base.png']);
      break;

      case SL.Board.COLOR_GREY: base = new Sprite(ui.sprites['grey_arrow_base.png']);
      break;
    }

    base.position = board.identifyHexFromTile(word.first).position;
    base.scale = Hexagon.defaultScale;
    base.rotation = orientation(word.first, word.tiles[1]);
    addChild(base);

    for(int i = 1 ; i < word.tiles.length -1 ; i ++){

      Sprite segment;

      switch(word.color){

        case SL.Board.COLOR_RED: segment = new Sprite(ui.sprites['blue_arrow_segment.png']);
        break;

        case SL.Board.COLOR_BLUE: segment = new Sprite(ui.sprites['blue_arrow_segment.png']);
        break;

        case SL.Board.COLOR_GREY: segment = new Sprite(ui.sprites['grey_arrow_segment.png']);
        break;
      }

      segment.position = board.identifyHexFromTile(word.tiles[i]).position;
      segment.scale = Hexagon.defaultScale;
      segment.rotation = orientation(word.tiles[i-1], word.tiles[i]);
      addChild(segment);


      segments.add(segment);

    }


    switch(word.color){

      case SL.Board.COLOR_RED: head = new Sprite(ui.sprites['blue_arrow_head.png']);
      break;

      case SL.Board.COLOR_BLUE: head = new Sprite(ui.sprites['blue_arrow_head.png']);
      break;

      case SL.Board.COLOR_GREY: head = new Sprite(ui.sprites['grey_arrow_head.png']);
      break;
    }

    head.position = board.identifyHexFromTile(word.last).position;
    head.scale = Hexagon.defaultScale;
    head.rotation = orientation(word.tiles[word.tiles.length-2], word.tiles.last);

    addChild(head);

  }


  double orientation (SL.Tile first, SL.Tile second){

      Hexagon hexOne = board.identifyHexFromTile(first);
      Hexagon hexTwo = board.identifyHexFromTile(second);

      return acos((hexOne.position.dx - hexTwo.position.dx)/(hexOne.position.dy - hexTwo.position.dy));
  }





}