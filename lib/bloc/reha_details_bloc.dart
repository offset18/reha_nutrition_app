import 'dart:async';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reha_nutrition_app/data/reha_data.dart';
import 'package:meta/meta.dart';

import 'package:reha_nutrition_app/bloc/reha_details_event.dart';
import 'package:reha_nutrition_app/bloc/reha_details_state.dart';

class RehaDetailsBloc extends Bloc<RehaDetailsEvent, RehaDetailsState> {
  final RehaData Reha;
  RehaDetailsBloc({required this.Reha}) : super(RehaDetailsInitial());

  @override
  Stream<RehaDetailsState> mapEventToState(
      RehaDetailsEvent event,
      ) async* {
    if (event is BackTappedEvent) {
      yield BackTappedState();
    } else if (event is RehaExerciseCellTappedEvent) {
      yield RehaExerciseCellTappedState(
        currentExercise: event.currentExercise,
        nextExercise: event.nextExercise,
      );
    }
  }
}