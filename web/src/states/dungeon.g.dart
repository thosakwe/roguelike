// GENERATED CODE - DO NOT MODIFY BY HAND

part of states.dungeon;

// **************************************************************************
// Generator: GameStateGenerator
// Target: class Dungeon
// **************************************************************************

abstract class _$DungeonStateMixin {
  void create(Game game) {}

  void preload(Game game) {
    game.load.spritesheet('tile', 'assets/tile.png', 30, 42);
  }

  get STATE =>
      jsify({'create': allowInterop(create), 'preload': allowInterop(preload)});
}

final DungeonState = new Dungeon().STATE;
