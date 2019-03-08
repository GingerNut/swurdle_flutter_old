


import 'dart:math';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:swurdle_flutter/flutter_interface.dart';
import 'package:swurdle_flutter/game_board.dart';
import 'package:swurdlelogic/swurdlelogic.dart';

class Hexagon extends NodeWithSize {

  final FlutterInterface ui;
  final Position pos;
  final Tile tile;
  final bool portrait;
   double hexSize;

   Node hex;
   Node twist;
   Sprite letter;

  double minX;
  double minY;
  double maxX;
  double maxY;

  bool fingerDown = false;

  static const spacing = 16.0;
  static const root3over2 = 0.8660254037844;

  double defaultScale;

  double homeX;
  double homeY;

  double _x;
  double _y;

  set x(double posX){
    _x = posX;
    position = Offset(_x, _y);
  }

  set y(double posY){
    _y = posY;
    position = Offset(_x, _y);
  }

  draw(){

    twist = new Node();
    twist.rotation = 270;
    if(portrait) rotation = 90;

    children.clear();

    addChild(hex);

    addChild(twist);

    twist.addChild(letter);

    scale = defaultScale;

    x = homeX;
    y = homeY;
  }

  setBeige(){
    hex = new Sprite(ui.sprites['hexagon_beige.png']);
    letter = new Sprite(getLetter(ui.blackFont));

    draw();
  }

  setBrown(){
    hex = new Sprite(ui.sprites['hexagon_brown.png']);
    letter = new Sprite(getLetter(ui.whiteFont));

    draw();
  }

  setRed(){
    hex = new Sprite(ui.sprites['hexagon_red.png']);
    letter = new Sprite(getLetter(ui.whiteFont));

    draw();
  }

  setBlue(){
    hex = new Sprite(ui.sprites['hexagon_blue.png']);
    letter = new Sprite(getLetter(ui.whiteFont));

    draw();
  }

  setGrey(){
    hex = new Sprite(ui.sprites['hexagon_grey.png']);
    letter = new Sprite(getLetter(ui.whiteFont));

    draw();
  }

  Hexagon(this.ui, this.pos, this.tile, this.portrait) : super(null){

    setVariables();

    setBeige();

  }

  double lastX;
  double lastY;

  double deltaX = 0.0;
  double deltaY = 0.0;


  bool isFingerOn(Offset offset){

    return (offset.dx >= homeX - minX && offset.dx < homeX + maxX &&
        offset.dy >= homeY - minY && offset.dy < homeY + maxY);
  }


  @override
  bool isPointInside (Offset nodePoint) {

    return (nodePoint.dx >= minX && nodePoint.dx < maxX &&
        nodePoint.dy >= minY && nodePoint.dy < maxY);
  }

  @override handleEvent(SpriteBoxEvent event) {
    if (event.type == PointerDownEvent){
      fingerDown = true;
      ui.dragFrom = tile;
      print('tapped ${pos.letters[ui.dragFrom.k]}');
      zPosition = 2;
      scale = scale * 1.5;
    }

    else if (event.type == PointerUpEvent){
      fingerDown = false;
      print('finger up ${pos.letters[ui.dragFrom.k]}');

      ui.select(tile);

      zPosition = 0;
      scale = defaultScale;
      position = new Offset(homeX, homeY);
    }

    else if (event.type == PointerMoveEvent){

      if(lastX == null ) lastX = event.boxPosition.dx;
      else{

        deltaX = event.boxPosition.dx - lastX;
        lastX = event.boxPosition.dx;
      }

      if(lastY == null) lastY = event.boxPosition.dy;
      else {

        deltaY = event.boxPosition.dy - lastY;
        lastY = event.boxPosition.dy;
      }

      if(fingerDown) position += new Offset(deltaX, deltaY);


    }

    return true;
  }

  setVariables(){
    const padding = 1.0;
    const horizontal_packing = 0.75;



    hexSize = min(GameBoard.HORIZONTAL_SIZE / size * root3over2 /1.63, GameBoard.VERTICAL_SIZE/ size * root3over2 / 1.45);

    hexSize /= 1.8;

    double hexagonSpacingVertical = hexSize * (2 + padding * 2) * root3over2;
    double hexagonSpacingHorizontal = hexSize * (2 + padding * 2) * horizontal_packing;

    double horizontalPadding = (GameBoard.HORIZONTAL_SIZE - hexagonSpacingHorizontal * size)/2;
    double verticalPadding = (GameBoard.VERTICAL_SIZE - hexagonSpacingVertical * size)/2 ;



    homeX = tile.i * hexagonSpacingHorizontal + hexagonSpacingHorizontal ;
    homeY = tile.j * hexagonSpacingVertical + hexagonSpacingVertical ;
    if(tile.i.isEven) homeY += verticalPadding/2;

    minX = -hexSize * 2;
    minY = -hexSize * 2;
    maxX = hexSize * 2;
    maxY = hexSize  * 2;

    defaultScale = 0.78;
  }
  
  SpriteTexture getLetter(SpriteSheet sheet){
       
    switch(ui.letters[tile.k]){
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