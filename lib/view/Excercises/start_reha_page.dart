import 'package:reha_nutrition_app/bloc/start_reha_state.dart';
import 'package:reha_nutrition_app/data/excercise_data.dart';
import 'package:reha_nutrition_app/bloc/start_reha_bloc.dart';
import 'package:reha_nutrition_app/widget/reha/start_reha_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartRehaPage extends StatelessWidget {
  final ExerciseData exercise;
  final ExerciseData currentExercise;
  final ExerciseData? nextExercise;

  StartRehaPage(
      {required this.exercise,
        required this.currentExercise,
        required this.nextExercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContext(context),
    );
  }

  BlocProvider<StartRehaBloc> _buildContext(BuildContext context) {
    return BlocProvider<StartRehaBloc>(
      create: (context) => StartRehaBloc(),
      child: BlocConsumer<StartRehaBloc, StartRehaState>(
        buildWhen: (_, currState) => currState is StartRehaInitial,
        builder: (context, state) {
          return StartRehaContent(
            exercise: exercise,
            nextExercise: nextExercise,
          );
        },
        listenWhen: (_, currState) => currState is BackTappedState,
        listener: (context, state) {
          if (state is BackTappedState) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}