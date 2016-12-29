import 'dart:html';
import 'package:js/js.dart';
import 'package:js/js_util.dart';
import 'package:phaser/phaser.dart';
import 'states/states.dart';
import 'constants.dart';

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

  void preload(Game game) {
    game.state
      ..add(States.LOADING, LoadingState)
      ..add(States.DUNGEON, DungeonState);
  }

  void create(Game game) {
    game.state.start(States.LOADING);
  }
}
