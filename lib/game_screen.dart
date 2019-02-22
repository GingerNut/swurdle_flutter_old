

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swurdle_flutter/game_board.dart';



class GameScreen extends StatefulWidget {
  GameScreen({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Swurdle'),
      ),
      body:
      new CustomPaint(
        painter: GameBoard(),
        child: Center(

        ),
      ),

    );
  }




}

