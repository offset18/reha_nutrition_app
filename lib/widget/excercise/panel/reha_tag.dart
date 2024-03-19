
import 'package:flutter/material.dart';
import 'package:reha_nutrition_app/common/color_ui.dart';

class RehaTag extends StatelessWidget {

  final String content;

  RehaTag({required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ThemeColors.primCol1.withOpacity(0.12),
      ),
      child: Row(
        children: [

          const SizedBox(width: 7),
          Text(content, style: TextStyle(color: ThemeColors.primCol1, fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}