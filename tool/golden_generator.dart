import 'dart:io';

void main() {
  final rootDir = Directory('lib/core/widgets');
  final testFile = File('test/golden/manual_widget_test.dart');

  if (!rootDir.existsSync()) {
    print('❌ lib/core/widgets 경로가 존재하지 않습니다.');
    return;
  }

  final buffer = StringBuffer();
  buffer.writeln('// GENERATED TEST FILE - FILL IN PARAMS MANUALLY');
  buffer.writeln("import 'package:flutter/material.dart';");
  buffer.writeln("import 'package:flutter_test/flutter_test.dart';");

  final widgetNames = <String, String>{};
  final importSet = <String>{};

  for (final file in rootDir.listSync(recursive: true)) {
    if (file is! File || !file.path.endsWith('.dart')) continue;

    final content = file.readAsStringSync();
    final matches = RegExp(r'class (\w+)\s+extends\s+(StatelessWidget|ConsumerWidget|HookWidget)')
        .allMatches(content);

    if (matches.isEmpty) continue;

    final importPath = file.path.replaceAll('\\', '/').replaceFirst('lib/', 'package:team_kiosk/');
    importSet.add("import '$importPath';");

    for (final match in matches) {
      final className = match.group(1)!;
      widgetNames[className] = className;
    }
  }

  for (final import in importSet) {
    buffer.writeln(import);
  }

  buffer.writeln('');
  buffer.writeln('void main() {');
  buffer.writeln('  final testWidgetsMap = <String, Widget>{');

  for (final name in widgetNames.keys) {
    buffer.writeln("    '$name': $name(/* TODO: fill params */),");
  }

  buffer.writeln('  };');
  buffer.writeln('');
  buffer.writeln('  for (final entry in testWidgetsMap.entries) {');
  buffer.writeln('    testWidgets("\${entry.key} golden test", (tester) async {');
  buffer.writeln('      await tester.pumpWidget(MaterialApp(home: entry.value));');
  buffer.writeln('      await expectLater(find.byType(entry.value.runtimeType),');
  buffer.writeln('        matchesGoldenFile("goldens/\${entry.key}.png"));');
  buffer.writeln('    });');
  buffer.writeln('  }');
  buffer.writeln('}');

  testFile.createSync(recursive: true);
  testFile.writeAsStringSync(buffer.toString());

  print('✅ 골격 생성 완료: ${widgetNames.length}개 위젯');
}