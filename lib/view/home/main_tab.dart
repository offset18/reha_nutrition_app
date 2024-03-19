import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:reha_nutrition_app/common/color_ui.dart';
import 'package:reha_nutrition_app/view/Excercises/reha.dart';
import 'package:reha_nutrition_app/view/home/home_view.dart';
import 'package:reha_nutrition_app/view/meals/meal_view.dart';
import 'package:reha_nutrition_app/view/nutrition/nutrition_summary.dart';
import 'package:reha_nutrition_app/view/regist/login_view.dart';
import 'package:reha_nutrition_app/view/regist/reg_view.dart';
import 'package:reha_nutrition_app/view/stats/barchart.dart';
import 'package:reha_nutrition_app/widget/nutrition/consumednutrition.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
/*
Tabbar for the navigation between the screens
 */

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selected = 0;
  final PageStorageBucket pageBucket = PageStorageBucket();
  Widget currentTab = const LoginView();

  var heart = false;
  PageController controller = PageController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

     //to make floating action button notch transparent

      //to avoid the floating action button overlapping behavior,
      // when a soft keyboard is displayed
      // resizeToAvoidBottomInset: false,
      body: PageView(
        controller: controller,
        children: [
          ProfileScreen(),
          RehasPage(),
          MealListView(),
          DailySummaryDetailBody(),

        ],
      ),
      bottomNavigationBar: StylishBottomBar(
          option: AnimatedBarOptions(
            // iconSize: 32,
            barAnimation: BarAnimation.fade,
            iconStyle: IconStyle.animated,
            // opacity: 0.3,
          ),
          items: [
            BottomBarItem(
              icon: const Icon(
                Icons.house_outlined,
              ),
              selectedIcon: const Icon(Icons.house_rounded),
              // selectedColor: Colors.teal,
              backgroundColor: ThemeColors.primCol2,
              title: const Text('Home'),

            ),
            BottomBarItem(
              icon: const Icon(Icons.sports_gymnastics_sharp),
              selectedIcon: const Icon(Icons.sports_gymnastics),

              backgroundColor: ThemeColors.primCol2,
              // unSelectedColor: Colors.purple,
              // backgroundColor: Colors.orange,
              title: const Text('Reha'),

            ),
            BottomBarItem(
                icon: const Icon(
                  Icons.dinner_dining,
                ),
                selectedIcon: const Icon(
                  Icons.dinner_dining_rounded,
                ),

                backgroundColor: ThemeColors.primCol2,
                title: const Text('Essen')),
            BottomBarItem(
                icon: const Icon(
                  Icons.book_outlined,
                ),
                selectedIcon: const Icon(
                  Icons.book_rounded,
                ),
                backgroundColor: ThemeColors.primCol2,

                title: const Text('Log')),
          ],
          hasNotch: true,
          fabLocation: StylishBarFabLocation.center,
          currentIndex: selected ?? 0,
          onTap: (index) {
            controller.jumpToPage(index);
            setState(() {
              selected = index;
            });
          }),

    );
  }
}
