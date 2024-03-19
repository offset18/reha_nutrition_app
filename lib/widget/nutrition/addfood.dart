import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:reha_nutrition_app/common/color_ui.dart';
import 'package:reha_nutrition_app/view/nutrition/addmeal.dart';
import 'package:reha_nutrition_app/view/nutrition/addmeds.dart';
/*
Button to jump into the food list too add the eaten meal
 */


class AddFoodButtonToo extends StatelessWidget {
  const AddFoodButtonToo({
    Key ? key
  }): super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          GestureDetector(
            onTap: (){
            },
            child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    color: ThemeColors.primCol1,
                    borderRadius: BorderRadius.circular(20)
                ),
              child: TextButton(
                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => FoodAddList() ));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Bitte Treffen Sie ihre Auswahl'),
                ),);},
                child: const Text('Essen',
                    style: TextStyle(fontSize: 27)),
            )
          ),
          ),
          GestureDetector(
            onTap: (){

            },
            child: Container(

                height: 50,
                width: 100,
                decoration: BoxDecoration(

                    color: ThemeColors.primCol1,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: TextButton(
                  onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => MedAddList() ));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Bitte treffen Sie ihre Auswahl'),));},
                  child: const Text('Medikamente',

                    style: TextStyle(fontSize: 15)),

                )
            ),
          )
        ],
      ),
    );
  }
}