# Flutter 유용한 명령어 모음

## 에뮬레이터 관련 명령어

```bash
# 사용 가능한 에뮬레이터 목록 확인
flutter emulators

# 특정 에뮬레이터 실행
flutter emulators --launch <emulator_id>
# 예: flutter emulators --launch Galaxy_S22_API_31

# 새 에뮬레이터 생성
flutter emulators --create [--name xyz]
```

## 디바이스 관련 명령어

```bash
# 연결된 모든 디바이스 확인
flutter devices

# 특정 디바이스에서 실행
flutter run -d <device_id>
# 예: flutter run -d emulator-5554
```

## 앱 실행 및 빌드 명령어

```bash
# 디버그 모드로 실행
flutter run

# 릴리즈 모드로 실행
flutter run --release

# 프로파일 모드로 실행
flutter run --profile

# 특정 타겟 플랫폼으로 빌드
flutter build <platform>
# 예: flutter build apk
# 예: flutter build ios
# 예: flutter build web
```

## 프로젝트 관리 명령어

```bash
# 프로젝트 의존성 가져오기
flutter pub get

# 프로젝트 의존성 업데이트
flutter pub upgrade

# Flutter 버전 확인
flutter --version

# Flutter 환경 진단
flutter doctor

# Flutter 캐시 정리
flutter clean
```

## Hot Reload 관련 단축키

앱 실행 중 터미널에서 사용 가능한 키:

- `r`: Hot Reload (변경사항 적용)
- `R`: Hot Restart (앱 완전 재시작)
- `q`: 앱 종료
- `p`: 토글 디버그 배너
- `h`: 도움말 표시

## 패키지 관련 명령어

```bash
# 패키지 추가
flutter pub add <package_name>

# 개발 전용 패키지 추가
flutter pub add --dev <package_name>

# 패키지 제거
flutter pub remove <package_name>
```

## 테스트 관련 명령어

```bash
# 모든 테스트 실행
flutter test

# 특정 테스트 파일 실행
flutter test test/widget_test.dart

# 커버리지 리포트와 함께 테스트 실행
flutter test --coverage
```

## 유용한 플러그인 설치 확인

```bash
# 플러그인 상태 확인
flutter pub deps

# 플러그인 라이선스 확인
flutter pub licenses
```
