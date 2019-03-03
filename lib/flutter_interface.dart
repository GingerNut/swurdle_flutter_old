
import 'package:spritewidget/spritewidget.dart';

import 'package:flutter/services.dart';
import 'package:swurdlelogic/swurdlelogic.dart';


class FlutterInterface extends Interface{
  ImageMap imageMap;
  SpriteSheet sprites;
  SpriteSheet blackFont;

  AssetBundle bundle;

  FlutterInterface(this.bundle);

  loadGraphics() async{
     imageMap = new ImageMap(bundle);

    await imageMap.load(<String>[
      'assets/sprite_sheet.png',
      'assets/black_fonts.png',
    ]);

    String spriteString = await bundle.loadString('assets/sprite_template.json');
    String blackFontString = await bundle.loadString('assets/black_fonts.json');

    sprites = new SpriteSheet(imageMap['assets/sprite_sheet.png'], spriteString);
    blackFont = new SpriteSheet(imageMap['assets/black_fonts.png'], blackFontString);

  }

  Future<String> loadString(String fileName) async{
    String string = await bundle.loadString('assets/' + fileName);
    return string;
  }







}