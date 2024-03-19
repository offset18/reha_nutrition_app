import 'package:flutter/material.dart';
import 'package:reha_nutrition_app/common/color_ui.dart';
import 'package:reha_nutrition_app/view/regist/start_reg_view.dart';
/*
Starting Page into the App
 */


class StartView extends StatefulWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
              controller: controller,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: media.width,
                  height: media.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/img/start.jpg",
                        width: media.width,
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Deine Reha-App - Starte durch",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w600)
                        ),

                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
                         decoration: BoxDecoration(color: ThemeColors.primCol1, borderRadius: BorderRadius.circular(25)),
                        child: IconButton (icon: Icon( Icons.navigate_next,color: Colors.white),onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterView() ));
                        },),
                      ),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
