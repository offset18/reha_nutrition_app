import 'package:reha_nutrition_app/data/excercise_data.dart';

class RehaData {
  final String title;
  final String exercices;

  final int currentProgress;
  final int progress;
  final String image;
  final List<ExerciseData> exerciseDataList;

  RehaData({
    required this.title,
    required this.exercices,

    required this.currentProgress,
    required this.progress,
    required this.image,
    required this.exerciseDataList,
  });

  @override
  String toString() {
    return 'RehaData(title: $title, exercices: $exercices, currentProgress: $currentProgress, progress: $progress, image: $image, exerciseDataList: $exerciseDataList)';
  }
}