import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spritewidget/spritewidget.dart';
import 'package:swurdle_flutter/game_screen.dart';
import 'package:swurdlelogic/swurdlelogic.dart';
import 'dart:ui' as ui;


ui.Image sprites;
ui.Image swurl;
ui.Image baize;

AssetBundle _initBundle() {
  if (rootBundle != null)
    return rootBundle;
  return new NetworkAssetBundle(new Uri.directory(Uri.base.origin));
}

final AssetBundle _bundle = _initBundle();

main() async {

  WidgetsFlutterBinding.ensureInitialized();

  ImageMap images = new ImageMap(_bundle);

  sprites = await images.loadImage('assets/sprites.png');
  //baize = await images.loadImage('assets/baize.png');
  //swurl = await images.loadImage('assets/swurl.png');

  game = new Game();

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

