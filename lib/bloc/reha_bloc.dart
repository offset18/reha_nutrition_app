import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:reha_nutrition_app/data/reha_data.dart';
import 'package:meta/meta.dart';

import 'package:reha_nutrition_app/bloc/reha_event.dart';
import 'package:reha_nutrition_app/bloc/reha_start.dart';

class RehasBloc extends Bloc<RehasEvent, RehasState> {
  RehasBloc() : super(RehasInitial());

  @override
  Stream<RehasState> mapEventToState(
      RehasEvent event,
      ) async* {
    if (event is CardTappedEvent) {
      yield CardTappedState(Reha: event.reha);
    }
  }
}