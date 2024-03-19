import 'package:flutter/material.dart';
//import 'package:group_listview_demo/traction_group_seprator.dart';
import 'package:grouped_list/grouped_list.dart';


/*
Overview of dishes which been recommended for the rehatime
 */


class MealListView extends StatefulWidget {
  @override
  _MealListViewState createState() => _MealListViewState();
}




class _MealListViewState extends State<MealListView> {
  List _elements = [
    {
      "title": "Quark-Leinöl-Dip",
      "category": "Frühstück",
      "image": "assets/img/start.jpg",
      "group": "Woche 1"
    },
    {
      "title": "Salat",
      "category": "Mittag",
      "image": "assets/img/pasta.png",
      "group": "Woche 1"
    },
    {
      "title": "Pasta",
      "category": "Abendessen",
      "image": "assets/img/pasta.png",
      "group": "Woche 1"
    },
    {
      "title": "Quark-Leinöl-Dip",
      "category": "Frühstück",
      "image": "assets/img/quark.png",
      "group": "Woche 2"
    },
    {
      "title": "Spinat",
      "category": "Mittag",
      "image": "assets/img/quark.png",
      "group": "Woche 2"
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Essen'),
      ),
      body: GroupedListView<dynamic, String>(

        elements: _elements,
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
                    child: Image(
                        image: AssetImage(element['image']), fit: BoxFit.cover),
                    //borderRadius: BorderRadius.all(Radius.circular(5)),
                  )),
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
                                element['title'],
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
                                      child: Text('${element['title']}'),
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
            item1['title'].compareTo(item2['title']),
        useStickyGroupSeparators: true,
        floatingHeader: true,
        order: GroupedListOrder.DESC,
      ),
    );
  }
}
