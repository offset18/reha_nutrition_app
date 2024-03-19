import 'package:flutter/material.dart';
import 'package:reha_nutrition_app/view/home/main_tab.dart';

import '../../comm_widg/rtextfld.dart';
import '../../common/color_ui.dart';
/*
Login Page for the user
 */

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>  {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hallo,",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                  ),
                  Text(
                    "erstellen Sie ihren Account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const RoundTextField(
                    hitText: "Email",
                    icon: Icon(Icons.mail_outline),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  RoundTextField(
                    hitText: "Password",
                    icon: Icon(Icons.lock),
                    obscureText: true,
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 55, vertical: 15),
                    decoration: BoxDecoration(color: ThemeColors.primCol1,
                        borderRadius: BorderRadius.circular(25)),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeTab() ));
                      },
                      child: const Text('Login'),
                    ),),

                ]
            ),
          ),
        ),
      ),
    );
  }

}