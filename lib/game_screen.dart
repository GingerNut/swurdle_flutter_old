

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swurdle_flutter/game_board.dart';
import 'package:swurdlelogic/swurdlelogic.dart';



class GameScreen extends StatefulWidget {

  final Game game;


  GameScreen(this. game, {Key key}) : super(key: key);




  @override
  _MyHomePageState createState() => _MyHomePageState(game);
}

class _MyHomePageState extends State<GameScreen> {

  Game game;

  _MyHomePageState(this.game);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swurdle'),
      ),

      drawer: ListTile(
        leading: Icon(Icons.change_history),
        title: Text('Change history'),
        onTap: () {
          // change app state...
          Navigator.pop(context); // close the drawer
        },
      ),
      body: GameBoard(game.ui, true),

      backgroundColor : const Color(0xFF4caf50),

      bottomNavigationBar: new BottomNavigationBar(
        onTap: onTabTapped,
          items:[
            BottomNavigationBarItem(
              icon: Icon(Icons.code),
              title: Text ('swap'),

            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.code),
              title: Text('Swap'),
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Title'),
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.build),
              title: Text('settings'),
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.check),
              title: Text('Go'),
            )
          ]
      ),

    );
  }





  void onTabTapped(int index) {
  switch(index){
    case 0:
      game.ui.buttonSwap();
      game.ui.redraw();
      break;

    case 2:
      game.ui.reset();
      game.ui.redraw();
      break;
  }
  }
}

