import 'package:meta/meta.dart';
import 'package:reha_nutrition_app/bloc/start_reha_bloc.dart';

@immutable
abstract class StartRehaState {}

class StartRehaInitial extends StartRehaState {}

class BackTappedState extends StartRehaState {}

class PlayTimerState extends StartRehaState {
  final int time;

  PlayTimerState({
    required this.time,
  });
}

class PauseTimerState extends StartRehaState {
  final int currentTime;

  PauseTimerState({
    required this.currentTime,
  });
}