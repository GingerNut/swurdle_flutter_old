


import 'dart:math';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:swurdle_flutter/flutter_interface.dart';
import 'package:swurdle_flutter/game_board.dart';
import 'package:swurdlelogic/swurdlelogic.dart' as SL;

class Hexagon extends NodeWithSize {

  final FlutterInterface ui;
  final SL.Tile tile;
   double hexSize;

   int color;
   String letter;

   Node hexNode;
   Node twistNode;
   Sprite letterSprite;
   Sprite springSprite;


  double minX;
  double minY;
  double maxX;
  double maxY;

  bool fingerDown = false;

  static const spacing = 16.0;
  static const root3over2 = 0.8660254037844;

 static double defaultScale;

  double homeX;
  double homeY;

  double _x;
  double _y;


  Hexagon(this.ui, this.tile) : super(null){

    setVariables();

    minX = homeX -hexSize * 2;
    minY = homeY -hexSize * 2;
    maxX = homeX + hexSize * 2;
    maxY = homeY + hexSize  * 2;

    position = Offset(homeX, homeY);

  }


  set x(double posX){
    _x = posX;
    position = Offset(_x, _y);
  }

  set y(double posY){
    _y = posY;
    position = Offset(_x, _y);
  }

  initialise(){

    hexNode = new Sprite(ui.sprites['hexagon_beige.png']);
    color = tile.color;
    addChild(hexNode);

    twistNode = new Node();
    twistNode.rotation = 270;
    if(ui.portrait) rotation = 90;
    addChild(twistNode);


    letterSprite = new Sprite(getLetter(ui.blackFont));
    letter = tile.letter;
    twistNode.addChild(letterSprite);


    scale = defaultScale;

  }



  refresh(){

    bool colorChange = false;

    if(color != tile.color){

      colorChange = true;
      removeChild(hexNode);
      color = tile.color;

        switch(tile.color){

          case SL.Board.COLOR_NONE:
            hexNode = new Sprite(ui.sprites['hexagon_beige.png']);
            break;

          case SL.Board.COLOR_RED:
            hexNode = new Sprite(ui.sprites['hexagon_red.png']);
            break;

          case SL.Board.COLOR_BLUE:
            hexNode = new Sprite(ui.sprites['hexagon_blue.png']);
            break;

          case SL.Board.COLOR_PURPLE:
            hexNode = new Sprite(ui.sprites['hexagon_pink.png']);
            break;

          case SL.Board.COLOR_GOLD:
            hexNode = new Sprite(ui.sprites['hexagon_yellow.png']);
            break;

          case SL.Board.COLOR_GREY:
            hexNode = new Sprite(ui.sprites['hexagon_grey.png']);
            break;

          case SL.Board.COLOR_SELECTED:
            hexNode = new Sprite(ui.sprites['hexagon_brown.png']);
            break;

          case SL.Board.COLOR_WORD_BAD:
            hexNode = new Sprite(ui.sprites['hexagon_brown.png']);
            break;

          case SL.Board.COLOR_WORD_GOOD:
            hexNode = new Sprite(ui.sprites['hexagon_green.png']);
            break;

        }

      addChild(hexNode);
    }

    SL.Spring spring = tile.spring;

    if(spring != null){

      if(springSprite == null){

        switch (spring.player.color) {
          case SL.Board.COLOR_RED:
            springSprite = new Sprite(ui.sprites['star_red.png']);
            break;

          case SL.Board.COLOR_BLUE:
            springSprite = new Sprite(ui.sprites['star_blue.png']);
            break;

          case SL.Board.COLOR_PURPLE:
            springSprite = new Sprite(ui.sprites['star_red.png']);
            break;

          case SL.Board.COLOR_GOLD:
            springSprite = new Sprite(ui.sprites['star_red.png']);
            break;
        }

        addChild(springSprite);

      } else {

        removeChild(springSprite);

        addChild(springSprite);
      }


      colorChange = true;
    }



    if(tile.letter != letter || colorChange){

      letter = tile.letter;

      twistNode.removeChild(letterSprite);

      switch(color){
        case SL.Board.COLOR_SELECTED:
        case SL.Board.COLOR_GOLD:
        case SL.Board.COLOR_PURPLE:
        case SL.Board.COLOR_BLUE:
        case SL.Board.COLOR_RED:
        case SL.Board.COLOR_WORD_BAD:
        case SL.Board.COLOR_WORD_GOOD:
        letterSprite = new Sprite(getLetter(ui.whiteFont));
        break;

        default:
          letterSprite = new Sprite(getLetter(ui.blackFont));
          break;

      }

      twistNode = new Node();
      twistNode.rotation = 270;
      if(ui.portrait) rotation = 90;
      addChild(twistNode);

      twistNode.addChild(letterSprite);


    }


  }

  double lastX;
  double lastY;

  double deltaX = 0.0;
  double deltaY = 0.0;


 @override
  bool isPointInside (Offset offset) {

    return (offset.dx >= minX && offset.dx < maxX &&
        offset.dy >= minY && offset.dy < maxY);
  }


  setVariables(){
    const padding = 1.0;
    const horizontal_packing = 0.75;



    hexSize = min(GameBoard.HORIZONTAL_SIZE / ui.game.size * root3over2 /1.63, GameBoard.VERTICAL_SIZE/ ui.game.size * root3over2 / 1.45);

    hexSize /= 1.8;

    double hexagonSpacingVertical = hexSize * (2 + padding * 2) * root3over2;
    double hexagonSpacingHorizontal = hexSize * (2 + padding * 2) * horizontal_packing;

    double horizontalPadding = (GameBoard.HORIZONTAL_SIZE - hexagonSpacingHorizontal * ui.game.size)/2;
    double verticalPadding = (GameBoard.VERTICAL_SIZE - hexagonSpacingVertical * ui.game.size)/2 ;



    homeX = tile.i * hexagonSpacingHorizontal + hexagonSpacingHorizontal ;
    homeY = tile.j * hexagonSpacingVertical + hexagonSpacingVertical ;
    if(tile.i.isEven) homeY += verticalPadding/2;


    defaultScale = 0.78;
  }
  
  SpriteTexture getLetter(SpriteSheet sheet){
       
    switch(tile.letter){
      case 'A': return sheet['a.png'];
      case 'B': return sheet['b.png'];
      case 'C': return sheet['c.png'];
      case 'D': return sheet['d.png'];
      case 'E': return sheet['e.png'];
      case 'F': return sheet['f.png'];
      case 'G': return sheet['g.png'];
      case 'H': return sheet['h.png'];
      case 'I': return sheet['i.png'];
      case 'J': return sheet['j.png'];
      case 'K': return sheet['k.png'];
      case 'L': return sheet['l.png'];
      case 'M': return sheet['m.png'];
      case 'N': return sheet['n.png'];
      case 'O': return sheet['o.png'];
      case 'P': return sheet['p.png'];
      case 'Q': return sheet['q.png'];
      case 'R': return sheet['r.png'];
      case 'S': return sheet['s.png'];
      case 'T': return sheet['t.png'];
      case 'U': return sheet['u.png'];
      case 'V': return sheet['v.png'];
      case 'W': return sheet['w.png'];
      case 'X': return sheet['x.png'];
      case 'Y': return sheet['y.png'];
      case 'Z': return sheet['z.png'];
    }

    return null;
  }



  
}