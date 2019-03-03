
import 'package:spritewidget/spritewidget.dart';

import 'package:flutter/services.dart';
import 'package:swurdle_flutter/game_board.dart';
import 'package:swurdle_flutter/game_screen.dart';
import 'package:swurdlelogic/swurdlelogic.dart';


class FlutterInterface extends Interface{
  ImageMap imageMap;
  SpriteSheet sprites;
  SpriteSheet blackFont;
  SpriteSheet whiteFont;

  GameBoard screen;

  AssetBundle bundle;

  bool _valid = false;

  invalidate(){
    _valid = false;
    redraw();
  }

  register(GameBoard screen){
    this.screen = screen;
  }

  FlutterInterface(this.bundle);

  loadGraphics() async{
     imageMap = new ImageMap(bundle);

    await imageMap.load(<String>[
      'assets/sprite_sheet.png',
      'assets/black_fonts.png',
    ]);

    String spriteString = await bundle.loadString('assets/sprite_template.json');
    String blackFontString = await bundle.loadString('assets/black_fonts.json');
    //String whiteFontString = await bundle.loadString('assets/white_fonts.json');

    sprites = new SpriteSheet(imageMap['assets/sprite_sheet.png'], spriteString);
    blackFont = new SpriteSheet(imageMap['assets/black_fonts.png'], blackFontString);
    //whiteFont = new SpriteSheet(imageMap['assets/white_fonts.png'], whiteFontString);
  }

  Future<String> loadString(String fileName) async{
    String string = await bundle.loadString('assets/' + fileName);
    return string;
  }

  redraw() {

    if(screen != null) screen.redraw();

    _valid = true;
  }







}