import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class TimerViewModel extends ChangeNotifier {
  Timer? _timer;
  int time = 120;

  TimerViewModel() {
    startTimer();
  }

  cancelTimer() {
    _timer?.cancel();
  }

  void startTimer() {
    time = 120;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (time == 0) {
          timer.cancel();
        } else {
          time--;
          notifyListeners();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    cancelTimer();
  }
}

final timerViewModelProvider =
ChangeNotifierProvider.autoDispose<TimerViewModel>(
      (ref) => TimerViewModel(),
);


