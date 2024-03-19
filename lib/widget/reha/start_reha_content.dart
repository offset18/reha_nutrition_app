
import 'package:flutter/cupertino.dart';
import 'package:reha_nutrition_app/bloc/start_reha_event.dart';
import 'package:reha_nutrition_app/bloc/start_reha_state.dart';
import 'package:reha_nutrition_app/data/constants/pathconst.dart';
import 'package:reha_nutrition_app/data/constants/text_constants.dart';
import 'package:reha_nutrition_app/data/excercise_data.dart';
import 'package:reha_nutrition_app/comm_widg/fitness_button.dart';
import 'package:reha_nutrition_app/bloc/start_reha_bloc.dart';
import 'package:reha_nutrition_app/view/Excercises/start_reha_page.dart';
import 'package:reha_nutrition_app/view/nutrition/nutrition_summary.dart';
import 'package:reha_nutrition_app/widget/pain/slider.dart';
import 'package:reha_nutrition_app/widget/reha/start_reha_video.dart';
import 'package:reha_nutrition_app/bloc/reha_details_bloc.dart' as reha_bloc;
import 'package:reha_nutrition_app/view/nutrition/nutrition_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reha_nutrition_app/common/color_ui.dart';
/*
Page to start the Reha excercises
includes the view to all excercises of the common week
 */


class StartRehaContent extends StatelessWidget {
  final ExerciseData exercise;
  final ExerciseData? nextExercise;

  StartRehaContent({required this.exercise, required this.nextExercise});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: _createDetailedExercise(context),
      ),
    );
  }

  Widget _createDetailedExercise(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createBackButton(context),
          const SizedBox(height: 23),
          _createVideo(context),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(children: [
              _createTitle(),
              const SizedBox(height: 9),
              _createCancelButton(context),
              _createDescription(),
              const SizedBox(height: 30),
              _createSteps(),
            ]),
          ),
          _createTimeTracker(context),
        ],
      ),
    );
  }

  Widget _createBackButton(BuildContext context) {
    final bloc = BlocProvider.of<StartRehaBloc>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 8),
      child: GestureDetector(
        child: BlocBuilder<StartRehaBloc, StartRehaState>(
          builder: (context, state) {
            return Row(
              children: [
                Icon(Icons.arrow_back),
                const SizedBox(width: 17),
                Text(
                  "back",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            );
          },
        ),
        onTap: () {
          bloc.add(BackTappedEvent());
        },
      ),
    );
  }

  Widget _createVideo(BuildContext context) {
    final bloc = BlocProvider.of<StartRehaBloc>(context);
    return Container(
      height: 264,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: StartRehaVideo(
        exercise: exercise,
        onPlayTapped: (time) {
          bloc.add(PlayTappedEvent(time: time));
        },
        onPauseTapped: (time) {
          bloc.add(PauseTappedEvent(time: time));
        },
      ),
    );
  }

  Widget _createTitle() {
    return Text(exercise.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold));
  }

  Widget _createDescription() {
    return Text(exercise.description, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500));
  }

  Widget _createSteps() {
    return Column(
      children: [
        for (int i = 0; i < exercise.steps.length; i++) ...[
          Step(number: "${i + 1}", description: exercise.steps[i]),
          const SizedBox(height: 20),
        ],
      ],
    );
  }

  Widget _createTimeTracker(BuildContext context) {
    // final bloc = BlocProvider.of<StartRehaBloc>(context);
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          nextExercise != null
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "nextExercise",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                nextExercise?.title ?? "",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 6.5),
              Icon(Icons.access_time, size: 20),
              const SizedBox(width: 6.5),
              Text('minutes')
              // BlocBuilder<StartRehaBloc, StartRehaState>(
              //   buildWhen: (_, currState) => currState is PlayTimerState || currState is PauseTimerState,
              //   builder: (context, state) {
              //     return StartRehaTimer(
              //       time: bloc.time,
              //       isPaused: !(state is PlayTimerState),
              //     );
              //   },
              // ),
            ],
          )
              : SizedBox.shrink(),
          const SizedBox(height: 18),
          _createButton(context),
        ],
      ),
    );
  }

    

  Widget _createButton(BuildContext context) {
    return FitnessButton(
      title: nextExercise != null ? "next" : 'Finish',
      onTap: () {
        if (nextExercise != null) {
          List<ExerciseData> exercisesList = BlocProvider.of<reha_bloc.RehaDetailsBloc>(context).Reha.exerciseDataList;
          int currentExerciseIndex = exercisesList.indexOf(exercise);
          if (currentExerciseIndex < exercisesList.length - 1) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<reha_bloc.RehaDetailsBloc>(context),
                    child: StartRehaPage(
                      exercise: exercisesList[currentExerciseIndex + 1],
                      currentExercise: exercisesList[currentExerciseIndex + 1],
                      nextExercise: currentExerciseIndex + 2 < exercisesList.length ? exercisesList[currentExerciseIndex + 2] : null,
                    ),
                  )),
            );
          }
        } else {
          Navigator.of(context).pop();
        }
      },
    );
  }
}
Widget _createCancelButton(BuildContext context) {
  final bloc = BlocProvider.of<StartRehaBloc>(context);
  return Padding(
    padding: const EdgeInsets.only(left: 10, top: 8),
    child: GestureDetector(
      child: BlocBuilder<StartRehaBloc, StartRehaState>(
        builder: (context, state) {
          return Row(
            children: [
              Icon(Icons.cancel),
              const SizedBox(width: 40),
              Text(
                "Training Abbrechen",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          );
        },
      ),
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {

  AlertDialog alert = AlertDialog(
      title: const Text('Training abbrechen'),
      content: const Text('Möchten Sie das aktuelle Training abbrechen?'),
      actions: <Widget>[
      TextButton(
        child: const Text('Nein'),
      onPressed: ()=> Navigator.pop(context, 'Nein'),

        ),
        TextButton(
          child: const Text('Ja'),
          onPressed: ()   {Navigator.push(context, MaterialPageRoute(builder: (context) => const SliderPainScale() ));},

        ),
      ],
  );
              return alert;},


       );
      },
    ),
  );
}

class Step extends StatelessWidget {
  final String number;
  final String description;

  Step({required this.number, required this.description});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ThemeColors.primCol1.withOpacity(0.12),
          ),
          child: Center(child: Text(number, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ThemeColors.primCol1))),
        ),
        const SizedBox(width: 10),
        Expanded(child: Text(description)),
      ],
    );
  }
}