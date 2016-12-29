import 'dart:async';
import 'package:analyzer/analyzer.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';
import '../annotations.dart';

class GameStateGenerator extends GeneratorForAnnotation<GameState> {
  const GameStateGenerator() : super();

  @override
  Future<String> generateForAnnotatedElement(
      Element element, GameState annotation, BuildStep buildStep) async {
    if (element is ClassElement) {
      var clazz =
          new ClassBuilder('_\$${element.name}StateMixin', asAbstract: true);

      return prettyToSource(clazz.buildAst());
    } else {
      throw new InvalidGenerationSourceError(
          'Only classes can be game states.');
    }
  }
}
