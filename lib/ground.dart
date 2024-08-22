
import 'package:chomper_run/my_game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Ground extends PositionComponent with HasGameRef<MyGame> {
  static const String keyName = 'ground_key';

  Ground({required super.position})
    : super(
        size: Vector2(100, 10),
        anchor: Anchor.center,
        key: ComponentKey.named(keyName),
  );
  
  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, width, height),
      Paint()..color = Colors.red
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    
    final cameraPosition = gameRef.camera.viewfinder.position.y;
    position = Vector2(0, cameraPosition + 400);
  }
}