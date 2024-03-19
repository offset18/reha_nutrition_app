
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reha_nutrition_app/bloc/reha_details_event.dart';
import 'package:reha_nutrition_app/bloc/reha_details_state.dart';
import 'package:reha_nutrition_app/common/color_ui.dart';
import 'package:reha_nutrition_app/data/constants/pathconst.dart';
import 'package:reha_nutrition_app/data/excercise_data.dart';
import 'package:reha_nutrition_app/data/reha_data.dart';
import 'package:reha_nutrition_app/bloc/reha_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

/*
excercises list for the relevant reha weeks
 */
class ExercisesList extends StatelessWidget {
  final RehaData reha;
  final List<ExerciseData> exercises;

  const ExercisesList({required this.exercises, required this.reha});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 10),
      itemCount: exercises.length,
      itemBuilder: (context, index) {
        return ExerciseCell(
          currentExercise: exercises[index],
          nextExercise: index == exercises.length - 1 ? null : exercises[index + 1],
          reha: reha,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 15);
      },
    );
  }
}

class ExerciseCell extends StatelessWidget {
  final RehaData reha;
  final ExerciseData currentExercise;
  final ExerciseData? nextExercise;

  const ExerciseCell({
    required this.currentExercise,
    required this.reha,
    required this.nextExercise,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RehaDetailsBloc>(context);
    return BlocBuilder<RehaDetailsBloc, RehaDetailsState>(
      buildWhen: (_, currState) => currState is RehaExerciseCellTappedState,
      builder: (context, state) {
        return InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: () {
            bloc.add(
              RehaExerciseCellTappedEvent(
                currentExercise: currentExercise,
                nextExercise: nextExercise,
              ),
            );
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 10, right: 25, top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 5.0,
                  spreadRadius: 1.1,
                ),
              ],
            ),
            child: Row(
              children: [
                _createImage(),
                const SizedBox(width: 10),
                Expanded(
                  child: _createExerciseTextInfo(),
                ),
                const SizedBox(width: 10),
                _createRightArrow(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _createImage() {
    return Container(
      width: 75,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: AssetImage(reha.image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _createExerciseTextInfo() {
    final minutesStr = "minutes";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          currentExercise.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          minutesStr,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 11),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: LinearPercentIndicator(
            percent: currentExercise.progress,
            progressColor: ThemeColors.primCol1,
            backgroundColor: ThemeColors.primCol1.withOpacity(0.12),
            lineHeight: 6,
            padding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }

  Widget _createRightArrow() {
    return RotatedBox(
      quarterTurns: 2,
      child: Icon(
       Icons.arrow_forward,
      ),
    );
  }
}
