import 'package:meta/meta.dart';
import 'package:reha_nutrition_app/bloc/reha_details_bloc.dart';
import 'package:reha_nutrition_app/bloc/reha_details_state.dart';
import 'package:reha_nutrition_app/data/excercise_data.dart';

@immutable
abstract class RehaDetailsEvent {}

class BackTappedEvent extends RehaDetailsEvent {}

class RehaExerciseCellTappedEvent extends RehaDetailsEvent {
  final ExerciseData currentExercise;
  final ExerciseData? nextExercise;

  RehaExerciseCellTappedEvent({
    required this.currentExercise,
    required this.nextExercise,
  });
}