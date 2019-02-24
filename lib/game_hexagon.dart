


import 'dart:math';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:swurdle_flutter/game_board.dart';
import 'package:swurdle_flutter/main.dart';
import 'package:swurdlelogic/swurdlelogic.dart';

class Hexagon extends NodeWithSize {

  final Position pos;
  final Tile tile;
  final bool portrait;
   double hexSize;

  static const spacing = 16.0;
  static const root3over2 = 0.8660254037844;

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

  Hexagon(this.pos, this.tile, this.portrait, Size size) : super(size){
    userInteractionEnabled = true;

    // TODO touch is offset to the bottom left of the button

    setVariables();

    addChild(new Sprite(sprites['hexagon_beige.png']));

    Node node = new Node();

    addChild(node);

    node.addChild(new Sprite(getLetter(blackFont)));
    node.rotation = 270;

    if(portrait) rotation = 90;

    scale = 0.78;

    x = homeX;
    y = homeY;
  }

  @override handleEvent(SpriteBoxEvent event) {
    if (event.type == PointerDownEvent){
      print('finger down ${pos.letters[tile.k]}');
    }

    else if (event.type == PointerMoveEvent){
      print('finger up ${pos.letters[tile.k]}');
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

  }
  
  SpriteTexture getLetter(SpriteSheet sheet){
       
    switch(pos.letters[tile.k]){
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