import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:reha_nutrition_app/bloc/start_reha_event.dart';
import 'package:reha_nutrition_app/bloc/start_reha_state.dart';

class StartRehaBloc extends Bloc<StartRehaEvent, StartRehaState> {
  StartRehaBloc() : super(StartRehaInitial());

  int time = 0;

  @override
  Stream<StartRehaState> mapEventToState(
      StartRehaEvent event,
      ) async* {
    if (event is BackTappedEvent) {
      yield BackTappedState();
    } else if (event is PlayTappedEvent) {
      time = event.time;
      yield PlayTimerState(time: event.time);
    } else if (event is PauseTappedEvent) {
      time = event.time;
      yield PauseTimerState(currentTime: time);
    }
  }
}