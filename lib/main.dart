import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:swurdle_flutter/game_screen.dart';
import 'package:swurdlelogic/swurdlelogic.dart';

ImageMap _imageMap;
SpriteSheet sprites;
SpriteSheet blackFont;

AssetBundle _initBundle() {
  if (rootBundle != null)
    return rootBundle;
  return new NetworkAssetBundle(new Uri.directory(Uri.base.origin));
}

final AssetBundle _bundle = _initBundle();

main() async {

  WidgetsFlutterBinding.ensureInitialized();

  _imageMap = new ImageMap(_bundle);

  await _imageMap.load(<String>[
    'assets/sprite_sheet.png',
    'assets/black_fonts.png',
  ]);

  print('LOADED IMAGES');

  String spriteString = await _bundle.loadString('assets/sprite_template.json');
  String blackFontString = await _bundle.loadString('assets/black_fonts.json');

  print('LOADED JSON');

  sprites = new SpriteSheet(_imageMap['assets/sprite_sheet.png'], spriteString);
  blackFont = new SpriteSheet(_imageMap['assets/black_fonts.png'], blackFontString);

  print('LOADED SPRITESHEET');

  game = new Game();

  String wordlist = await _bundle.loadString('assets/words172000R.txt');

  await game.initialiseDictionary(wordlist);

  game.newGame();

  print('GAME LOADED');

  runApp(MyApp(game));
}

Tile tile;
Game game;


class MyApp extends StatelessWidget {

  final Game game;

  MyApp(this.game);


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Swurdle',
      theme: new ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF4caf50),
        accentColor: const Color(0xFF4caf50),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new GameScreen(game),

    );
  }
}

