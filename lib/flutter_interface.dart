
import 'package:spritewidget/spritewidget.dart';

import 'package:flutter/services.dart';
import 'package:swurdle_flutter/game_board.dart';
import 'package:swurdlelogic/swurdlelogic.dart';




class FlutterInterface extends Interface{
  ImageMap imageMap;
  SpriteSheet sprites;
  SpriteSheet blackFont;
  SpriteSheet whiteFont;

  GameBoardState state;
  bool portrait = true;

  AssetBundle bundle;

  register(GameBoardState state){
    this.state = state;
  }

  FlutterInterface(this.bundle);

  loadGraphics() async{
     imageMap = new ImageMap(bundle);

    await imageMap.load(<String>[
      'assets/sprite_sheet.png',
      'assets/black_fonts.png',
      'assets/white_fonts.png',
    ]);

    String spriteString = await bundle.loadString('assets/sprite_template.json');
    String fontString = await bundle.loadString('assets/fonts.json');


    sprites = new SpriteSheet(imageMap['assets/sprite_sheet.png'], spriteString);
    blackFont = new SpriteSheet(imageMap['assets/black_fonts.png'], fontString);
    whiteFont = new SpriteSheet(imageMap['assets/white_fonts.png'], fontString);
  }

  Future<String> loadString(String fileName) async{
    String string = await bundle.loadString('assets/' + fileName);
    return string;
  }


  Tile dragFrom;
  Tile dragTo;


  redraw(){

    if(state != null) state.setState(() => state.valid = false);

  }


}