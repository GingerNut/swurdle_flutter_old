

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swurdle_flutter/game_board.dart';
import 'package:swurdlelogic/swurdlelogic.dart';



class GameScreen extends StatefulWidget {

  final Game game;

  GameScreen(this. game, {Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState(game);
}

class _MyHomePageState extends State<GameScreen> {

  Game game;

  _MyHomePageState(this.game);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Swurdle'),
      ),
      body:
      new GameBoard(game.position, true),

    );
  }




}

