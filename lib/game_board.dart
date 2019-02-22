

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:swurdle_flutter/game_hexagon.dart';
import 'package:swurdlelogic/swurdlelogic.dart';

class GameBoard extends StatefulWidget {

  final Game game;

  GameBoard(this.game);

  @override
  _GameBoardState createState() => _GameBoardState(game);
}

class _GameBoardState extends State<GameBoard> {

  Game game;
  int size;

  _GameBoardState(this.game){
    size = 7;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body:
      new Container(
        decoration: new BoxDecoration(color: Colors.grey),
        child: new Row(
          children: <Widget>[

            new Column(
              children: <Widget>[

                new GameHexagon(game.position, game.board.tiles[0]),
                new GameHexagon(game.position, game.board.tiles[1]),
              ],
            ),

            new Column(
              children: <Widget>[
                new GameHexagon(game.position, game.board.tiles[1]),
                new GameHexagon(game.position, game.board.tiles[1]),
              ],
            )

          ],
        ),
      )

    );
  }
}