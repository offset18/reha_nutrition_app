
import 'package:flutter/material.dart';



class RoundTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hitText;
  final Icon icon;

  final bool obscureText;
  final EdgeInsets? margin;
  const RoundTextField({super.key, required this.hitText, required this.icon, this.controller, this.margin, this.keyboardType, this.obscureText = false });

  @override
  Widget build(BuildContext context) {
    var prefixIcon;
    return Container(
      margin: margin,
      decoration: BoxDecoration(
          color: Colors.white54, borderRadius: BorderRadius.circular(25)),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hitText,
            prefixIcon: icon,
            
        //    prefixIcon: Container(
          //      alignment: Alignment.center,
            //    width: 20,
              //  height: 20,
             // child: Icon(Icons.add),
               // ),
            hintStyle: TextStyle(color: Colors.grey, fontSize: 12)),
      ),
    );
  }
}