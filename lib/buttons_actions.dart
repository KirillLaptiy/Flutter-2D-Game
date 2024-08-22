
import 'package:chomper_run/my_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

MyGame _mygame = MyGame();

class GameStart extends StatelessWidget {
  const GameStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget (
      game: _mygame,
    );
  }

}