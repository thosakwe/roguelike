library states.loading;

import 'dart:html';
import 'package:js/js.dart';
import 'package:js/js_util.dart';
import 'package:phaser/phaser.dart';
import 'package:roguelike/src/annotations.dart';
import '../constants.dart';

part 'loading.g.dart';

@GameState(States.LOADING)
@Asset(name: Assets.KENYAN, url: 'assets/kenyan_m1.png')
@Asset(name: Assets.CHINESE, url: 'assets/chinese_m1.png')
@Asset(name: Assets.ARABIAN, url: 'assets/arabianboy.png')
class Loading extends _$LoadingStateMixin {
  create(Game game) => game.state.start(States.DUNGEON);
}
