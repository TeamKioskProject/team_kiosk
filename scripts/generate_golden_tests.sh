import 'dart:io';
import 'package:path/path.dart' as p;

/// 위젯 클래스 정규식 (ConsumerWidget 포함)
final widgetClassPattern = RegExp(
  r'class\s+(\w+)\s+extends\s+(ConsumerWidget|StatelessWidget|StatefulWidget)'
);

void main() {
  final libDir = Directory('lib/view');
  final files = libDir
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) =>
          f.path.endsWith('.dart') &&
          !f.path.contains('_test.dart') &&
          !f.path.contains('.freezed.dart'))
      .toList();

  final buffer = StringBuffer()
    ..writeln("import 'dart:io';")
    ..writeln("import 'package:flutter/material.dart';")
    ..writeln("import 'package:flutter_test/flutter_test.dart';")
    ..writeln("import 'package:flutter_riverpod/flutter_riverpod.dart';")
    ..writeln("import 'package:go_router/go_router.dart';")
    ..writeln("import 'package:network_image_mock/network_image_mock.dart';");

  for (final file in files) {
    final relative = p.posix.relative(file.path, from: 'lib'); // 슬래시 `/` 유지
    buffer.writeln("import 'package:team_kiosk/$relative';");
  }

  buffer.writeln("\nvoid main() {");

  for (final file in files) {
    final content = file.readAsStringSync();
    final match = widgetClassPattern.firstMatch(content);
    if (match == null) continue;

    final widgetClass = match.group(1)!;
    final relative = p.posix.relative(file.path, from: 'lib');
    final goldenName = relative.replaceAll('/', '_').replaceAll('.dart', '');

    buffer.writeln('''
  testWidgets('$relative golden test', (tester) async {
    await mockNetworkImagesFor(() async {
      final router = GoRouter(
        initialLocation: '/',
        routes: [GoRoute(path: '/', builder: (context, state) => $widgetClass())],
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp.router(routerConfig: router),
        ),
      );

      await tester.pumpAndSettle();
      await expectLater(
        find.byType($widgetClass),
        matchesGoldenFile('goldens/$goldenName.png'),
      );
    });
  });
''');
  }

  buffer.writeln("}");

  final outputFile = File('test/golden/auto_golden_test.dart');
  outputFile.createSync(recursive: true);
  outputFile.writeAsStringSync(buffer.toString());

  print('✅ Golden 테스트 코드 생성 완료 → ${outputFile.path}');
}
