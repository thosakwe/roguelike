library states.dungeon;

import 'dart:html';
import 'package:js/js.dart';
import 'package:js/js_util.dart';
import 'package:phaser/phaser.dart';
import 'package:roguelike/src/annotations.dart';
import '../constants.dart';

part 'dungeon.g.dart';

@GameState(States.DUNGEON)
@Asset(
    name: Assets.TILE, url: 'assets/tile.png', frameWidth: 30, frameHeight: 42)
class Dungeon extends _$DungeonStateMixin {
  create(Game game) {
    game.world.width = window.innerWidth * 2;
    var horiz = window.innerWidth / 30;

    for (int i = 0; i <= horiz; i++) {
      int frame;

      if (i == 0)
        frame = 0;
      else if (i == horiz)
        frame = 3;
      else {
        frame = game.rnd.between(2, 3);
      }

      game.add.sprite(30 * horiz, 0, Assets.TILE, frame);
      
    }
  }
}
