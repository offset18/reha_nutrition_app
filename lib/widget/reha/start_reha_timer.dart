import 'package:custom_timer/custom_timer.dart';

import 'package:flutter/material.dart';

class StartRehaTimer extends StatefulWidget {
  final int time;
  final bool isPaused;

  StartRehaTimer({
    required this.time,
    required this.isPaused,
  });

  @override
  _StartRehaTimerState createState() => _StartRehaTimerState();
}

class _StartRehaTimerState extends State<StartRehaTimer> {
  @override
  Widget build(BuildContext context) {
    return widget.isPaused ? _createCountdownTimer() : _createCountdownTimer();
  }

  Widget _createCountdownTimer() {
    return CustomTimer(
      from: Duration(seconds: widget.time),
      to: Duration(seconds: 0),
      onBuildAction: CustomTimerAction.auto_start,
      builder: (CustomTimerRemainingTime remaining) {
        return Text(
          "${remaining.minutes}:${remaining.seconds}",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        );
      },
    );
  }




}