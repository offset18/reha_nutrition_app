//import 'package:fitness_flutter/core/const/color_constants.dart';
//import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:reha_nutrition_app/bloc/reha_event.dart';
import 'package:reha_nutrition_app/bloc/reha_start.dart';
import 'package:reha_nutrition_app/data/constants/text_constants.dart';
import 'package:reha_nutrition_app/data/reha_data.dart';
import 'package:reha_nutrition_app/bloc/reha_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:reha_nutrition_app/common/color_ui.dart';

/*
reha card at the entry point of the excercises
basically after clicking on the tab
 */

class RehaCard extends StatelessWidget {
  final RehaData reha;
  RehaCard({Key? key, required this.reha}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RehasBloc>(context);
    return Container(
      width: double.infinity,
      height: 140,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 5.0, spreadRadius: 1.1)],
      ),
      child: Material(
        color: Colors.transparent,
        child: BlocBuilder<RehasBloc, RehasState>(
          buildWhen: (_, currState) => currState is CardTappedState,
          builder: (context, state) {
            return InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                bloc.add(CardTappedEvent(reha: reha));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(reha.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 3),
                          Text(reha.exercices + " " + TextConstants.exercisesUppercase,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2),
                          const SizedBox(height: 3),
                          Text("",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2),
                          Spacer(),
                          Text('${reha.currentProgress}/${reha.progress}', style: TextStyle(fontSize: 10)),
                          SizedBox(height: 3),

                        ],
                      ),
                    ),
                    SizedBox(width: 60),
                    Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.asset(reha.image, fit: BoxFit.fill))),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}