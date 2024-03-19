
import 'package:reha_nutrition_app/data/reha_data.dart';
import 'package:reha_nutrition_app/widget/excercise/panel/reha_details_panel.dart';
import 'package:reha_nutrition_app/widget/reha/reha_details_body.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RehaDetailsContent extends StatelessWidget {
  final RehaData reha;

  const RehaDetailsContent({required this.reha});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: _createSlidingUpPanel(context),
    );
  }

  Widget _createSlidingUpPanel(BuildContext context) {
    return SlidingUpPanel(
      panel: RehaDetailsPanel(rehaexcercise: reha),
      body: RehaDetailsBody( reha: reha),
      minHeight: MediaQuery.of(context).size.height * 0.65,
      maxHeight: MediaQuery.of(context).size.height * 0.87,
      isDraggable: true,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
    );
  }
}