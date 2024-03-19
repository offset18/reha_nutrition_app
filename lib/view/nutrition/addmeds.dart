import 'package:flutter/material.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:reha_nutrition_app/view/nutrition/nutrition_summary.dart';
/*
Adds meds which been taken because of pain
during the rehabilitation
 */


class MedAddList extends StatefulWidget {
  @override
  _MedAddListState createState() => _MedAddListState();
}

class _MedAddListState extends State<MedAddList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fügen Sie eingenommene Medikamente hinzu'),
      ),
      body: GroupedListView<dynamic, String>(
        elements: _medselements,
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
                                  content: Text(('Es wurde ${element['name']} ${element['dose']} hinzugefügt')), ),); },
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
                                      child: (Text('Dosis in mg: ${element['dose']}')),
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


  final List _medselements =
  [
    {
      "name" : "diclofenac",
      "dose" : "25 mg",
      "image": "assets/img/diclofenac.jpg",
      "group": "Diclofenac"


    },
    {
      "name" : "paracetamol",
      "dose" : "500 mg",
      "image": "assets/img/paracetamol.jpg",
      "group": "paracetamol"

    },
    {
      "name" : "paracetamol",
      "dose" : "1000 mg",
      "image": "assets/img/para_1000.jpg",
      "group": "paracetamol"

    },
  ];
}