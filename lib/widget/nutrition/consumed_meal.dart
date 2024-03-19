import 'package:flutter/material.dart';
//import 'package:nutrition/config/config.dart';

import 'package:reha_nutrition_app/common/color_ui.dart';
import 'package:reha_nutrition_app/model/mealconsumed.dart';
import 'package:reha_nutrition_app/model/foodconsumed.dart';

/*
widget/ model for the later input of the data
 */

Widget mealConsumedt(MealConsumed mealConsumed) {
  return ConstrainedBox(
    constraints: BoxConstraints(
      maxHeight: double.infinity,
    ),
    child: Container(
      margin: EdgeInsets.only(top: 30, bottom: 30),
      padding: EdgeInsets.only(left: 10),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [

                    SizedBox(width: 20),

                  ],
                ),

              ],
            ),
          ),
          SizedBox(height: 20),
          ListView.builder(
            itemCount: mealConsumed.consumedFoods!.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 70,
                margin: EdgeInsets.zero,
                child: IntrinsicHeight(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          VerticalDivider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                          SizedBox(width: 15),
                          Container(
                            height: 54,
                            width: 54,
                            decoration: BoxDecoration(
                                color: mealConsumed.consumedFoods![index].boxColor,
                                borderRadius: BorderRadius.circular(20)
                            ),

                          ),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                mealConsumed.consumedFoods![index].foodName!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                mealConsumed.consumedFoods![index].consumedAmount!,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ]
                    )
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}