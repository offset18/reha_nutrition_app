import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:reha_nutrition_app/view/nutrition/nutrition_summary.dart';

/*
Adds selected Meal to the daily used / eaten carbs
 */

class FoodAddList extends StatefulWidget {
  @override
  _FoodAddListState createState() => _FoodAddListState();
}

class _FoodAddListState extends State<FoodAddList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fügen Sie ihr Essen hinzu'),
      ),
      body: GroupedListView<dynamic, String>(
       elements: _nutritionelements,
        groupBy: (element) => element['group'],
        groupComparator: (value1, value2) => value2.compareTo(value1),

        // useStickyGroupSeparators: true,
        groupSeparatorBuilder: (String groupByValue) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Flexible(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        groupByValue,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),

        itemBuilder: (context, element) {
          return Card(
            elevation: 10.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(


                      child: ClipRect(
                          child: InkWell(
                            onTap:() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const DailySummaryDetailBody() ));
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(('Es wurde ${element['name']} hinzugefügt')),
                            ),);},
                        child: Image(
                            image: AssetImage(element['image']), fit: BoxFit.cover),

                        //borderRadius: BorderRadius.all(Radius.circular(5)),
                      ))),
                  Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                element['name'],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                maxLines: 2,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.set_meal_rounded,
                                        color: Colors.grey, size: 16),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: (Text('Vitamin C in G ${element['vitamin-c']}')),
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.egg_alt_outlined,
                                        color: Colors.grey, size: 16),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: (Text('Protein in G ${element['protein']}')),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        },
        itemComparator: (item1, item2) =>
            item1['name'].compareTo(item2['name']),
        useStickyGroupSeparators: true,
        floatingHeader: true,
        order: GroupedListOrder.DESC,
      ),
    );
  }


 final List _nutritionelements =
  [
    {
      "id": "coles-soy-milk-regular",
      "name": "SojaMilch",
      "image": "assets/img/soymilk.jpg",
      "group":"Getränk",
      "energy": 244,
      "protein": 3.1,
      "fat": 3.0,
      "saturated-fat": 0.2,
      "trans-fat": 0.2,
      "polyunsaturated-fat": 1,
      "monounsaturated-fat": 1.8,
      "vitamin-c": 0,
      "carbohydrate": 4.7,
      "sugars": 1.6,
      "dietary-fibre": 0,
      "sodium": 47
    },


    {
      "id": "fruit-apple-granny-smith-fresh-raw",
      "name": "Apfel",
      "image": "assets/img/apple.jpg",
      "group": "Obst",
      "energy": 218,
      "carbohydrate": 13.81,
      "sugars": 10.39,
      "dietary-fibre": 2.4,
      "fat": 0.17,
      "protein": 0.26,
      "vitamin-b1": 0.017,
      "vitamin-b2": 0.026,
      "vitamin-b3": 0.091,
      "vitamin-b5": 0.061,
      "vitamin-b6": 0.041,
      "vitamin-b9": 0.003,
      "vitamin-c": 4.6,
      "calcium": 6,
      "iron": 0.12,
      "magnesium": 5,
      "phosphorus": 11,
      "potassium": 107,
      "zinc": 0.04
    },



    {
      "id": "fruit-banana-fresh-raw",
      "name": "Banane",
      "image": "assets/img/banana.jpg",
      "group": "Obst",
      "energy": 371,
      "carbohydrate": 22.84,
      "sugars": 12.23,
      "dietary-fibre": 2.6,
      "fat": 0.33,
      "protein": 1.09,
      "vitamin-b6": 0.4,
      "vitamin-c": 8.7,
      "manganese": 0.3
    },

    {
      "id": "veg-spinach-fresh",
      "name": "Spinach",
      "image": "assets/img/spinat.jpg",
      "group": "Gemüse",
      "energy": 97,
      "carbohydrate": 3.6,
      "sugars": 0.4,
      "dietary-fibre": 2.2,
      "fat": 0.4,
      "protein": 2.9,
      "vitamin-a": 469,
      "vitamin-b2": 0.189,
      "vitamin-b6": 0.195,
      "vitamin-b9": 0.194,
      "vitamin-c": 28,
      "vitamin-e": 2,
      "vitamin-k": 483,
      "calcium": 99,
      "iron": 2.7,
      "magnesium": 79,
      "manganese": 0.897,
      "potassium": 558
    },

  ];
}