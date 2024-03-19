import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:reha_nutrition_app/view/stats/barchart.dart';


import 'package:reha_nutrition_app/view/stats/hstats.dart';
//import 'package:training_and_diet_app/ui/pages/workout_screen.dart';
import 'package:vector_math/vector_math.dart' as math;

/*
Home/Landingpage which includes some stats already
Profile of the person been shown too
 */
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final today = DateTime.now();


    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            height: height * 0.45,
            left: 0,
            right: 0,
            child: SizedBox.expand(
             // borderRadius: const BorderRadius.vertical(
               // bottom: const Radius.circular(40),
              //),
              child: ClipRect(
                //color: Colors.white,
                //padding: const EdgeInsets.only(top: 40, left: 32, right: 16, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        "Hallo Michael",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      /*TODO User foto einfügen*/

                        trailing: ClipOval(

                        child:Image (
                          image: AssetImage('assets/img/start.jpg'),fit: BoxFit.cover),
                      )
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(

                      children: <Widget>[
                        const SizedBox(height: 60),
                        HomeStatistics(),
                        const SizedBox(height: 60),


                      ],

                    ),
                    Row(
                        children: <Widget>[
                          const SizedBox(height: 60),
                          TextButton(
                              onPressed: () => LinechartPainKillers(),

                              child: const Text('weitere Stats',

                              )
                          )
                        ]
                    )
        ],

                ),

              ),
            ),

          ),

        ],
      ),
    );
  }
}
