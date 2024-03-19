//import 'package:reha_nutrition_app//core/const/color_constants.dart';
import 'package:reha_nutrition_app/common/color_ui.dart';
import 'package:reha_nutrition_app/data/constants/data_const.dart';
import 'package:reha_nutrition_app/data/reha_data.dart';
import 'package:reha_nutrition_app/widget/reha/reha_card.dart';
import 'package:flutter/material.dart';

/*
brings the relevant content for the reha
 */


class RehaContent extends StatelessWidget {
  RehaContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.BackgrColor,
      height: double.infinity,
      width: double.infinity,
      child: _createHomeBody(context),
    );
  }

  Widget _createHomeBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Rehas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView(
              children: DataConstants.Rehas
                  .map(
                    (e) => _createRehaCard(e),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createRehaCard(RehaData rehaData) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: RehaCard(reha: rehaData),
    );
  }
}