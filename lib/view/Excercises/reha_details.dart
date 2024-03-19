import 'package:reha_nutrition_app/bloc/reha_details_state.dart';
import 'package:reha_nutrition_app/data/constants/text_constants.dart';
import 'package:reha_nutrition_app/data/excercise_data.dart';
import 'package:reha_nutrition_app/data/reha_data.dart';
import 'package:reha_nutrition_app/comm_widg/fitness_button.dart';
import 'package:reha_nutrition_app/view/Excercises/start_reha_page.dart';
import 'package:reha_nutrition_app/bloc/reha_details_bloc.dart';
import 'package:reha_nutrition_app/widget/reha/reha_details_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reha_nutrition_app/extensions/listext.dart';

class RehaDetailsPage extends StatelessWidget {
  final RehaData reha;
  RehaDetailsPage({required this.reha});

  @override
  Widget build(BuildContext context) {
    return _buildContext(context);
  }

  BlocProvider<RehaDetailsBloc> _buildContext(BuildContext context) {
    return BlocProvider<RehaDetailsBloc>(
      create: (context) => RehaDetailsBloc(Reha: reha),
      child: BlocConsumer<RehaDetailsBloc, RehaDetailsState>(
        buildWhen: (_, currState) => currState is RehaDetailsInitial,
        builder: (context, state) {
          return Scaffold(
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: FitnessButton(
                  title: "start",
                  onTap: () {
                    ExerciseData? exercise = reha.exerciseDataList.firstWhereOrNull((element) => element.progress < 1);
                    if (exercise == null) exercise = reha.exerciseDataList.first;
                    int exerciseIndex = reha.exerciseDataList.indexOf(exercise);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<RehaDetailsBloc>(context),
                            child: StartRehaPage(
                              exercise: exercise!,
                              currentExercise: exercise,
                              nextExercise: exerciseIndex + 1 < reha.exerciseDataList.length ? reha.exerciseDataList[exerciseIndex + 1] : null,
                            ),
                          )),
                    );
                  },
                ),
              ),
              body: RehaDetailsContent(reha: reha));
        },
        listenWhen: (_, currState) => currState is BackTappedState || currState is RehaExerciseCellTappedState,
        listener: (context, state) {
          if (state is BackTappedState) {
            Navigator.pop(context);
          } else if (state is RehaExerciseCellTappedState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<RehaDetailsBloc>(context),
                    child: StartRehaPage(
                      exercise: state.currentExercise,
                      currentExercise: state.currentExercise,
                      nextExercise: state.nextExercise,
                    ),
                  )),
            );
          }
        },
      ),
    );
  }
}