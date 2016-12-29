import 'dart:html';
import 'package:js/js.dart';
import 'package:js/js_util.dart';
import 'package:phaser/phaser.dart';

class GameEngine {
  void start() {
    new Game(
        window.innerWidth,
        window.innerHeight,
        Phaser.AUTO,
        'game',
        jsify({
          'preload': allowInterop(preload),
          'create': allowInterop(create)
        }));
  }

  void preload(Game game) {}

  void create(Game game) {
    print('Soon');
  }
}
