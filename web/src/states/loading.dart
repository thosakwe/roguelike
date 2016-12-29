library states.loading;

import 'package:phaser/phaser.dart';
import 'package:roguelike/roguelike.dart';
import '../constants.dart';

part 'loading.g.dart';

@GameState(States.LOADING)
@Asset(name: Assets.KENYAN, url: 'assets/kenyan_m1.png')
@Asset(name: Assets.CHINESE, url: 'assets/chinese_m1.png')
@Asset(name: Assets.ARABIAN, url: 'assets/arabianboy.png')
class Loading extends _$LoadingStateMixin {}
