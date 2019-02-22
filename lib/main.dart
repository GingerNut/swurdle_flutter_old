import 'package:flutter/material.dart';
import 'package:swurdle_flutter/game_screen.dart';
import 'package:swurdlelogic/swurdlelogic.dart';





void main() => runApp(MyApp());

Game game;

class MyApp extends StatelessWidget {

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
      home: new GameScreen(),
    );
  }
}
