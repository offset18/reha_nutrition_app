import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';


//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reha_nutrition_app/model/foodconsumed.dart';
import 'package:reha_nutrition_app/widget/nutrition/consumed_meal.dart';
import 'package:reha_nutrition_app/model/mealconsumed.dart';

/*
consumed meals with relevant data
 */


class MealsConsumed extends StatefulWidget {
  const MealsConsumed({
    Key ? key
  }): super(key: key);

  @override
  State < MealsConsumed > createState() => _MealsConsumedState();
}

class _MealsConsumedState extends State < MealsConsumed > {

  List < MealConsumed > mealsConsumed = [];

  @override
  void didChangeDependencies() {
    provideMealsConsumed();
    super.didChangeDependencies();
  }
  @override
  void initState() {
    super.initState();
    // Initialization code here
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: mealsConsumed.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(bottom:15),
        itemBuilder: (BuildContext context, int index) {
          return mealConsumedt(mealsConsumed[index]);
        }
    );
  }

  void provideMealsConsumed() {
    mealsConsumed.add(
        MealConsumed(


            consumedFoods: [
              FoodConsumed(
                foodName: 'Quark-Leinöl-Speise',
                consumedAmount: '200 g',
                boxColor: Colors.white10,
                icon: const AssetImage(
                    'assets/img/quarkoildip.png'),

                ),

              FoodConsumed(
                foodName: 'Grüner Salat',
                consumedAmount: '100 g',
                boxColor: Colors.white12,
                icon: const AssetImage(
                    'assets/img/salad.png'),

                ),

            ]
        )
    );

  }
}