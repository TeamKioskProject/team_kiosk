#!/bin/bash
set -e

echo "🔍 Creating temporary directory..."
mkdir -p .tmp

echo "🔍 Fetching latest changes..."
git fetch origin +refs/heads/*:refs/remotes/origin/* --prune

BASE_REF=${GITHUB_BASE_REF:-main}

# 기본 브랜치가 존재하는지 확인
if ! git rev-parse --verify origin/$BASE_REF >/dev/null 2>&1; then
  echo "⚠️ Base branch $BASE_REF does not exist. Skipping test generation."
  exit 0
fi

echo "🔍 Finding changed widget files..."

# 변경된 파일 목록 가져오기 (실패 무시)
git diff --name-only origin/$BASE_REF..HEAD > .tmp/changed_widgets_raw.txt || true

# 변경된 위젯 파일 필터링
grep -E "lib/.*\.dart" .tmp/changed_widgets_raw.txt | grep -v "_test.dart" > .tmp/changed_widgets.txt || true

# 변경된 위젯 파일이 없는 경우 스크립트 종료
if [ ! -s .tmp/changed_widgets.txt ]; then
  echo "⚠️ No widget files changed. Skipping test generation."
  exit 0
fi

echo "✅ Changed widget files found:"
cat .tmp/changed_widgets.txt

# 기본 테스트 파일 생성
while IFS= read -r widget_file; do
  # 테스트 파일 경로
  test_file="${widget_file/lib/test}"
  test_file="${test_file/.dart/_test.dart}"
  golden_dir="${test_file/test/goldens}"
  
  # 위젯 이름 추출
  widget_name=$(basename "$widget_file" .dart)

  # import 경로 변환
  import_path="${widget_file#lib/}"
  
  # 테스트 파일 생성
  if [ ! -f "$test_file" ]; then
    echo "📝 Creating test file for $widget_file -> $test_file"
    mkdir -p "$(dirname "$test_file")"
    cat > "$test_file" <<EOF
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:team_kiosk/main.dart';
import 'package:team_kiosk/$import_path';

void main() {
  setUpAll(() {
    httpOverrides();
  });

  testWidgets('${widget_name} 접근성 및 멀티 해상도 골든 테스트', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // 위젯 로드 테스트
    expect(find.byType(${widget_name}), findsOneWidget);
    
    // 스크린 리더 접근성 테스트
    final semantics = tester.getSemantics(find.byType(${widget_name}));
    expect(semantics, isNotNull, reason: '스크린 리더에서 접근할 수 없는 위젯입니다.');
    semantics.visitChildren((child) {
      final hasLabel = child.label != null && child.label.isNotEmpty;
      expect(hasLabel, isTrue, reason: '모든 중요한 요소는 스크린 리더를 위한 레이블이 있어야 합니다.');
      return true;
    });
    
    // 여러 해상도에서 테스트
    final resolutions = [
      Size(300, 600),
      Size(375, 812),
      Size(768, 1024),
      Size(1024, 1366),
    ];

    for (final resolution in resolutions) {
      tester.binding.window.physicalSizeTestValue = resolution;
      tester.binding.window.devicePixelRatioTestValue = 2.0;
      await tester.pumpAndSettle();

      final goldenFile = '${golden_dir}/${widget_name}_${resolution.width.toInt()}x${resolution.height.toInt()}.png';
      await expectLater(
        find.byType(${widget_name}),
        matchesGoldenFile(goldenFile)
      );
    }

    // 해상도 초기화
    tester.binding.window.clearPhysicalSizeTestValue();
  });
}

void httpOverrides() {
  HttpOverrides.global = _MockHttpOverrides();
}

class _MockHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final httpClient = super.createHttpClient(context);
    httpClient.findProxy = (uri) => 'DIRECT';
    httpClient.badCertificateCallback = (cert, host, port) => true;
    return httpClient;
  }
}
EOF
    
    git add "$test_file"
  else
    echo "✅ Test file already exists: $test_file"
  fi
  
  # 골든 파일 디렉토리 생성
  mkdir -p "$golden_dir"
  
  # 기본 골든 파일 생성 (비어 있는 이미지)
  for resolution in 300x600 375x812 768x1024 1024x1366; do
    golden_file="${golden_dir}/${widget_name}_${resolution}.png"
    if [ ! -f "$golden_file" ]; then
      echo "🖼️ Creating empty golden file for $widget_file -> $golden_file"
      convert -size ${resolution} xc:white "$golden_file"
      git add "$golden_file"
    else
      echo "✅ Golden file already exists: $golden_file"
    fi
  done
done < .tmp/changed_widgets.txt
