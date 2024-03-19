
class ExerciseData {
  final String title;

  final double progress;
  final String video;
  final String description;
  final List<String> steps;

  ExerciseData({
    required this.title,

    required this.progress,
    required this.video,
    required this.description,
    required this.steps,
  });

  @override
  String toString() {
    return 'ExerciseData(title: $title,  progress: $progress, video: $video)';
  }
}
