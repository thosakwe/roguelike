import 'package:build_runner/build_runner.dart';
import 'package:source_gen/builder.dart';
import 'package:roguelike/roguelike.dart';

final PhaseGroup PHASES = new PhaseGroup.singleAction(
    new GeneratorBuilder(const [const GameStateGenerator()]),
    new InputSet('roguelike', const ['lib/**/*.dart', 'web/**/*.dart']));
