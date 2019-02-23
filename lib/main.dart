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
  ]);

  print('LOADED IMAGES');

  String json = await _bundle.loadString('assets/sprite_template.json');

  print('LOADED JSON');

  sprites = new SpriteSheet(_imageMap['assets/sprite_sheet.png'], json);

  print('LOADED SPRITESHEET');

  game = new Game();

  print('GAME LOADED');

  SpriteTexture test = sprites['hexagon_beige.png'];


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

