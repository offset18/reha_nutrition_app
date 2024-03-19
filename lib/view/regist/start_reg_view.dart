import 'package:flutter/material.dart';
import 'package:reha_nutrition_app/view/regist/login_view.dart';

import '../../comm_widg/rtextfld.dart';
import '../../common/color_ui.dart';

/*
Page to register into the App
 */

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
                  "Guten Tag",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                ),
                Text(
                  "erstellen Sie ihren Account",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 18,
                      ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                const RoundTextField(
                  hitText: "First Name",
                  icon:Icon(Icons.account_box),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                const RoundTextField(
                  hitText: "Last Name",
                    icon:Icon(Icons.account_box)
                ),
                SizedBox(
                  height: media.width * 0.04,
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
                    margin: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
                    decoration: BoxDecoration(color: ThemeColors.primCol1, borderRadius: BorderRadius.circular(25)),
                    child:  TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: (){
                        //  Navigator.push(context, MaterialPageRoute(builder: (context) => const Complet() ));
                      },
                      child: const Text('Registrieren'),
                    ),),


                Row(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey.withOpacity(0.5),
                        )),
                    Text(
                      "  Haben Sie schon einen Account  ",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey.withOpacity(0.5),
                        )),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),

                SizedBox(
                  height: media.width * 0.04,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
                  decoration: BoxDecoration(color: ThemeColors.primCol1, borderRadius: BorderRadius.circular(25)),
                  child:  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginView() ));
                    },
                    child: const Text('Login'),
                  ),),
                SizedBox(
                  height: media.width * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}