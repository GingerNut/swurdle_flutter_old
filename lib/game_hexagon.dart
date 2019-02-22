



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swurdle_flutter/main.dart';
import 'package:swurdlelogic/swurdlelogic.dart';

class GameHexagon extends StatefulWidget{

  final Position position;
  final Tile tile;

  GameHexagon(this.position, this.tile);

  @override
  _GameHexagonState createState() => _GameHexagonState(position, tile);
}

class _GameHexagonState extends State<GameHexagon> {

  Position position;
  Tile tile;

  _GameHexagonState(this.position, this.tile);

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(color: Colors.red),
      child: new Text(position.letter(tile.i, tile.j)),
    );
  }
}