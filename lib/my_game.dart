import 'package:chomper_run/ground.dart';
import 'package:chomper_run/obstacle_circle.dart';
import 'package:chomper_run/player.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MyGame extends FlameGame with TapCallbacks {
  late Player myPlayer;

  final List<Color> gameColors;

  MyGame({
    this.gameColors = const [
      Colors.redAccent,
      Colors.blueAccent,
      Colors.purpleAccent,
      Colors.yellowAccent,
    ],
  }) : super(
            camera:
                CameraComponent.withFixedResolution(width: 600, height: 1000));

  @override
  Color backgroundColor() => Colors.blueGrey;

  @override
  void onMount() {
    world.add(myPlayer = Player());

    world.add(Ground(position: Vector2(0, 400)));

    generateGameObstacles();

    super.onMount();
  }

  @override
  void update(double dt) {
    final cameraY = camera.viewfinder.position.y;
    final playerY = myPlayer.position.y;

    if (cameraY > playerY) {
      camera.viewfinder.position = Vector2(0, playerY);
    }

    super.update(dt);
  }

  @override
  void onTapDown(TapDownEvent event) {
    myPlayer.jump();
    super.onTapDown(event);
  }

  void removePlayer() {
    world.remove(myPlayer);
  }

  void generateGameObstacles() {
    world.add(ObstacleCircle(
      position: Vector2(0, -300),
      size: Vector2(200, 200),
      rotationSpeed: 2,
    ));

    world.add(ObstacleCircle(
      position: Vector2(0, -800),
      size: Vector2(350, 350),
      rotationSpeed: 2,
    ));

    world.add(ObstacleCircle(
      position: Vector2(0, -1100),
      size: Vector2(600, 600),
      rotationSpeed: 3.5,
    ));
  }
}
