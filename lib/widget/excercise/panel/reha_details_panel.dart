import 'package:reha_nutrition_app/data/constants/pathconst.dart';
import 'package:reha_nutrition_app/data/constants/text_constants.dart';
import 'package:reha_nutrition_app/data/reha_data.dart';
import 'package:reha_nutrition_app/widget/excercise/panel/excercises_list.dart';
import 'package:reha_nutrition_app/widget/excercise/panel/reha_tag.dart';
import 'package:flutter/material.dart';

/*
creates the view for the excercises
 */
class RehaDetailsPanel extends StatelessWidget {
  final RehaData rehaexcercise;

  RehaDetailsPanel({required this.rehaexcercise});

  @override
  Widget build(BuildContext context) {
    return _createPanelData();
  }

  Widget _createPanelData() {
    return Column(
      children: [
        const SizedBox(height: 15),
        _createRectangle(),
        const SizedBox(height: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _createHeader(),
              const SizedBox(height: 20),
              _createWorkoutData(),
              SizedBox(height: 20),
              _createExerciesList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createRectangle() {
    return Icon(Icons.linear_scale_outlined);
  }

  Widget _createHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        rehaexcercise.title + "  " + TextConstants.rehas,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _createWorkoutData() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          RehaTag(

            content: "",
          ),
          const SizedBox(width: 15),
          RehaTag(

            content: "",
          ),
        ],
      ),
    );
  }

  Widget _createExerciesList() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ExercisesList(exercises: rehaexcercise.exerciseDataList, reha: rehaexcercise),
      ),
    );
  }
}