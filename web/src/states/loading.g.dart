// GENERATED CODE - DO NOT MODIFY BY HAND

part of states.loading;

// **************************************************************************
// Generator: GameStateGenerator
// Target: class Loading
// **************************************************************************

abstract class _$LoadingStateMixin {
  void create(Game game) {}

  void preload(Game game) {
    game.load.spritesheet('kenyan', 'assets/kenyan_m1.png', 32, 48);
    game.load.spritesheet('chinese', 'assets/chinese_m1.png', 32, 48);
    game.load.spritesheet('arabian', 'assets/arabianboy.png', 32, 48);
  }

  get STATE =>
      jsify({'create': allowInterop(create), 'preload': allowInterop(preload)});
}

final LoadingState = new Loading().STATE;
