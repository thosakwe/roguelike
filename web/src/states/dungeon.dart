library states.dungeon;

import 'dart:html' show window;
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
  Group background, backgroundColliders;

  @override
  create(Game game) {
    resizeWorld(game);
    tileDungeon(game, 24, 24);
  }

  void resizeWorld(Game game) {
    var x = game.rnd.between(1, 2), y = game.rnd.between(1, 2);

    game.world.resize(window.innerWidth * x, window.innerHeight * y);
  }

  void tileDungeon(Game game, int frameWidth, int frameHeight) {
    var maxCols = (game.world.width / frameWidth).round();
    var maxRows = (game.world.height / frameHeight).round();
    createBackground(game, maxCols, maxRows, frameWidth, frameHeight);
  }

  void createBackground(
      Game game, int maxCols, int maxRows, int frameWidth, int frameHeight) {
    background = game.add.group();
    backgroundColliders = game.add.physicsGroup(Physics.ARCADE, background)
      ..enableBody = true;

    var currentRowInSpriteSheet = 0, framesPerRow = 5;

    for (int row = 0; row <= maxRows; row++) {
      for (int col = 0; col <= maxCols; col++) {
        int x = col * frameWidth, y = row * frameHeight;
        int frame, generic = -1;

        if (col == 0) {
          frame = currentRowInSpriteSheet * framesPerRow;
        } else if (col >= maxCols - 1) {
          frame = framesPerRow - 1 + (currentRowInSpriteSheet * framesPerRow);
        } else {
          generic++;

          if (generic == 0) {
            frame = 1 + (currentRowInSpriteSheet * framesPerRow);
          } else if (generic == 1) {
            frame = 2 + (currentRowInSpriteSheet * framesPerRow);
          } else if (generic == 2) {
            frame = 3 + (currentRowInSpriteSheet * framesPerRow);
            generic = -1;
          }
        }

        var tile = background.create(x, y, Assets.TILE, frame);

        if (row == 0 || col == 0 || row >= maxRows - 1 || col >= maxCols - 1) {
          this.backgroundColliders.add(tile);
          (tile.body as Body).immovable = true;
        }
      }

      if (currentRowInSpriteSheet == 0)
        currentRowInSpriteSheet = 1;
      else if (row >= maxRows - 2)
        currentRowInSpriteSheet = 3;
      else if (currentRowInSpriteSheet == 1)
        currentRowInSpriteSheet = 2;
      else if (currentRowInSpriteSheet == 2) currentRowInSpriteSheet = 1;
    }
  }
}
