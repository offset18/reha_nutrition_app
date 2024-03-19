import 'package:meta/meta.dart';
import 'package:reha_nutrition_app/bloc/reha_details_bloc.dart';
import 'package:reha_nutrition_app/data/excercise_data.dart';

@immutable
abstract class RehaDetailsState {}

class RehaDetailsInitial extends RehaDetailsState {}

class BackTappedState extends RehaDetailsState {}

class RehaExerciseCellTappedState extends RehaDetailsState {
  final ExerciseData currentExercise;
  final ExerciseData? nextExercise;

  RehaExerciseCellTappedState({
    required this.currentExercise,
    required this.nextExercise,
  });
}