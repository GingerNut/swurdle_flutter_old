

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

      Sprite back;

      switch(word.color){

        case SL.Board.COLOR_RED: back = Sprite(ui.sprites['red_arrow_base.png']);
        break;

        case SL.Board.COLOR_BLUE: back = Sprite(ui.sprites['blue_arrow_base.png']);
        break;

        case SL.Board.COLOR_GREY: back = Sprite(ui.sprites['grey_arrow_base.png']);
        break;
      }

      back.position = offset(word.tiles[i]);
      back.scale = Hexagon.defaultScale;
      back.rotation = orientation(word.tiles[i], word.tiles[i-1] );
      addChild(back);
      

      Sprite forward;

      switch(word.color){

        case SL.Board.COLOR_RED: forward = Sprite(ui.sprites['red_arrow_segment.png']);
        break;

        case SL.Board.COLOR_BLUE: forward = Sprite(ui.sprites['blue_arrow_segment.png']);
        break;

        case SL.Board.COLOR_GREY: forward = Sprite(ui.sprites['grey_arrow_segment.png']);
        break;
      }

      forward.position = offset(word.tiles[i]);
      forward.scale = Hexagon.defaultScale;
      forward.rotation = orientation(word.tiles[i-1], word.tiles[i]);
      addChild(forward);


      segments.add(forward);

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

    double rotation = 180;

      Hexagon hexOne = board.identifyHexFromTile(first);
      Hexagon hexTwo = board.identifyHexFromTile(second);

      if(ui.portrait){

        if(hexTwo.homeX == hexOne.homeX){
          rotation += (hexTwo.homeY > hexOne.homeY) ?  0 : 180 ;
        } else if(hexTwo.homeY == hexOne.homeY ){
          rotation += (hexTwo.homeX > hexOne.homeX) ?  90 : 270 ;

        } else rotation += atan((hexTwo.homeY - hexOne.homeY)/(hexTwo.homeX - hexOne.homeX));

      }

     return rotation;
  }

  Offset offset(SL.Tile tile){

    Hexagon hex = board.identifyHexFromTile(tile);

    return Offset(hex.homeX - homeX, hex.homeY - homeY);
  }





}