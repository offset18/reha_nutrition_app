import 'package:reha_nutrition_app/data/excercise_data.dart';
import 'package:reha_nutrition_app/data/reha_data.dart';
import 'package:reha_nutrition_app/data/constants/pathconst.dart';
import 'package:reha_nutrition_app/data/constants/text_constants.dart';
class DataConstants {

// Rehas

  // Rehas
  static final List<RehaData> Rehas = [
    RehaData(
        title: TextConstants.thirdweek,
        exercices: TextConstants.excercisesthird,

        currentProgress: 10,
        progress: 16,
        image: PathConstants.reha,
        exerciseDataList: [


          ExerciseData(
            title: "Dehnung Oberschenkel",

            progress: 0.0,
            video: PathConstants.harmstrings,
            description: "Beschreibung",
            steps: ["Begeben sie sich in den Langsitz in eine aufrechte Körperhaltung", "Nehmen Sie ein Seil oder Handtuch","Legen Sie dies auf die mittlere Fußsohle",
              "Führen Sie nun die Dehnung durch"]
          ),
          ExerciseData(
            title: "bla",

            progress: 0.0,
            video: PathConstants.backvideo,
            description: "tets",
            steps: ["test", "test2"],
          ),

        ]),
    RehaData(
        title: TextConstants.fourther,
        exercices: TextConstants.excerisesseven,

        currentProgress: 1,
        progress: 20,
        image: PathConstants.week5,
        exerciseDataList: [


          ExerciseData(
            title: "bla",

            progress: 0.0,
            video: PathConstants.backvideo,
            description: "tets",
            steps: ["test", "test2"],
          ),
        ]),

  ];

}
