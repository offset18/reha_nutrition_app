import 'package:flutter/material.dart';
import 'package:reha_nutrition_app/common/color_ui.dart';
import 'package:reha_nutrition_app/view/nutrition/nutrition_summary.dart';

/*
slider to define the pain after the excercise
 */


class SliderPainScale extends StatefulWidget {
  const SliderPainScale({Key? key}) : super(key: key);

  @override
  _SliderPainScaleState createState() => _SliderPainScaleState();
}

class _SliderPainScaleState extends State<SliderPainScale> {
  int pain = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Empfundener Schmerz"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Slider(
            label: "Bitte wählen Sie den Schmerz",
            value: pain.toDouble(),
            onChanged: (value) {
              setState(() {
                pain = value.toInt();
              });
            },
            min: 0,
            max: 10,
          ),
          Text(
            "Dein Empfinden des Schmerzes: " + pain.toString(),
            style: const TextStyle(
              fontSize: 32.0,
            ),
          ),

       Container(

              height: 50,
              width: 100,
              decoration: BoxDecoration(

                  color: ThemeColors.primCol1,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: TextButton(
                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => DailySummaryDetailBody() ));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Mit weiter erfassen Sie ihr Essen/Medikamente'),));},
                child: const Text('Weiter',

                    style: TextStyle(fontSize: 15)),

              )
          ),
        ],
      ),

    );
  }
}