import 'package:flutter/material.dart';
import 'package:reha_nutrition_app/view/home/home_view.dart';
import 'package:reha_nutrition_app/view/home/main_tab.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:reha_nutrition_app/widget/nutrition/consumednutrition.dart';

import 'package:reha_nutrition_app/widget/nutrition/addfood.dart';

/*
View for the summary of the daily taken meds/ meals

 */


class DailySummaryDetailBody extends StatefulWidget {
  const DailySummaryDetailBody({
    Key ? key
  }): super(key: key);

  @override
  State <DailySummaryDetailBody> createState() => _DailySummaryDetailBodyState();
}



class _DailySummaryDetailBodyState extends State <DailySummaryDetailBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Heute erfassten Dinge"),
        actions: <Widget>[
      IconButton(
      icon: Icon(
        Icons.home,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeTab()));
      },
      ),
    ],),
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(right: 15, left: 15),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const[
            //DailySummaryDetailScreenAppBar(),
            //Date(),
            MealsConsumed(),
            AddFoodButtonToo(),
          ],
        ),
      ),
    );
  }
}