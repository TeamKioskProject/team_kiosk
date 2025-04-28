name: 🐞 Bug Report
description: 버그를 신고할 때 사용하세요.
title: "[Bug] "
labels: ["bug"]
assignees: []

body:
- type: textarea
  attributes:
  label: 📋 버그 설명
  description: 어떤 버그인지 명확히 적어주세요.
  placeholder: ex) 로그인 버튼을 눌렀는데 반응이 없습니다.
  validations:
  required: true

- type: textarea
  attributes:
  label: ⚡ 재현 방법
  description: 버그를 재현하는 방법을 단계별로 적어주세요.
  placeholder: ex) 1. 앱 실행 → 2. 로그인 화면 이동 → 3. 로그인 버튼 클릭
  validations:
  required: true

- type: textarea
  attributes:
  label: 📸 스크린샷 (선택)
  description: 필요하면 스크린샷을 첨부해주세요.

- type: textarea
  attributes:
  label: 🛠 예상 해결 방법
  description: 어떻게 해결할 수 있을지 예상된다면 작성해주세요.