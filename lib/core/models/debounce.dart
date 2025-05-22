import 'dart:async';

class BottomSheetThrottler {
  DateTime? _lastShownTime;
  final Duration duration;

  BottomSheetThrottler({this.duration = const Duration(seconds: 2)});

  bool canShow() {
    final now = DateTime.now();
    if (_lastShownTime == null || now.difference(_lastShownTime!) > duration) {
      _lastShownTime = now;
      return true;
    }
    return false;
  }
}

class Debounce {
  final Duration delay;
  Timer? _timer;

  Debounce({required this.delay});

  run(action) {
    // 이미 기다리고 있었다면 타이머를 초기화
    if (_timer != null) {
      _timer!.cancel();
    }
    // 지정된 시간이 지나면 action을 실행
    _timer = Timer(delay, action);
  }
}
