#!/bin/bash

# 변경된 파일 목록 가져오기 (최근 10개의 커밋 기준)
CHANGED_FILES=$(git diff --name-only HEAD~10..HEAD | grep -E '\.dart$')

echo "🔍 Finding widgets in the following files:"
echo "$CHANGED_FILES"

WIDGET_NAMES=()

for file in $CHANGED_FILES; do
    # Widget 정의를 포함한 줄만 추출
    WIDGETS=$(grep -E 'class\s+\w+\s+extends\s+.*Widget' "$file" | awk '{print $2}')
    for widget in $WIDGETS; do
        if [[ ! " ${WIDGET_NAMES[@]} " =~ " ${widget} " ]]; then
            WIDGET_NAMES+=("$widget")
        fi
    done
done

# 결과 출력
echo "📝 Found the following widgets:"
for widget in "${WIDGET_NAMES[@]}"; do
    echo "- $widget"
done

# 테스트 파일 생성 (리스트 파일)
mkdir -p .tmp/
echo "${WIDGET_NAMES[@]}" > .tmp/changed_widgets.txt