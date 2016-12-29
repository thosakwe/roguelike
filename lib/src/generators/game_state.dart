import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:code_builder/code_builder.dart';
import 'package:source_gen/source_gen.dart';
import '../annotations.dart';
import 'package:source_gen/src/annotation.dart';

class GameStateGenerator extends GeneratorForAnnotation<GameState> {
  const GameStateGenerator() : super();

  @override
  Future<String> generateForAnnotatedElement(
      Element element, GameState annotation, BuildStep buildStep) async {
    if (element is ClassElement) {
      var lib = new LibraryBuilder();

      var clazz =
          new ClassBuilder('_\$${element.name}StateMixin', asAbstract: true);

      List<String> desired = ['preload', 'create', 'update', 'render'];
      var found = element.methods
          .where((m) => desired.contains(m.name))
          .map((m) => m.name)
          .toList();

      // Create preload if present

      var preload = new MethodBuilder.returnVoid('preload')
        ..addPositional(parameter('game', [new TypeBuilder('Game')]));
      var load = reference('game').property('load');

      for (var ann
          in element.metadata.where((m) => matchAnnotation(Asset, m))) {
        var type = ann.constantValue.getField('type')?.toStringValue() ??
            'spritesheet';
        var key = ann.constantValue.getField('name')?.toStringValue();
        var url = ann.constantValue.getField('url')?.toStringValue();
        var width =
            ann.constantValue.getField('frameWidth')?.toIntValue() ?? 32;
        var height =
            ann.constantValue.getField('frameHeight')?.toIntValue() ?? 48;

        if (key != null && url != null)
          preload.addStatement(load
              .invoke(type, [key, url, width, height].map(literal))
              .asStatement());
      }

      clazz.addMethod(preload);

      // Create state object
      if (!found.contains('preload')) found.add('preload');

      Map stateObj = found.fold({}, (m, str) {
        return m
          ..[literal(str)] = reference('allowInterop').call([reference(str)]);
      });

      clazz.addMethod(new MethodBuilder.getter('STATE',
          returns: reference('jsify').call([map(stateObj)])));

      lib.addMember(clazz);
      lib.addMember(new TypeBuilder(element.name)
          .newInstance([])
          .property('STATE')
          .asFinal('${element.name}State'));

      return prettyToSource(lib.buildAst());
    } else {
      throw new InvalidGenerationSourceError(
          'Only classes can be game states.');
    }
  }
}
