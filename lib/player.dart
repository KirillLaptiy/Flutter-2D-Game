
import 'package:chomper_run/ground.dart';
import 'package:chomper_run/my_game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Player extends PositionComponent with HasGameRef<MyGame> {
  
  final _velocity = Vector2(0, 15.0);
  final _gravity = 1500;
  final _jumpValue = 500.0;

  @override
  void onMount() {
    super.onMount();
    position = Vector2.zero();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += _velocity * dt;
    _velocity.y += _gravity * dt;

    Ground ground = gameRef.findByKeyName(Ground.keyName)!;

    if (position.y > ground.position.y) {
      _velocity.y = 0;
      // gameRef.removePlayer();
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    canvas.drawCircle(
      Offset.zero,
      15,
      Paint()..color = Colors.orange,
    );
  }

  void jump() {
    _velocity.y = -_jumpValue;
  }
}