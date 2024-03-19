import 'package:meta/meta.dart';
import 'package:reha_nutrition_app/bloc/start_reha_bloc.dart';

@immutable
abstract class StartRehaEvent {}

class BackTappedEvent extends StartRehaEvent {}

class PlayTappedEvent extends StartRehaEvent {
  final int time;

  PlayTappedEvent({
    required this.time,
  });
}

class PauseTappedEvent extends StartRehaEvent {
  final int time;

  PauseTappedEvent({
    required this.time,
  });
}

class ChangeTimerEvent extends StartRehaEvent {}