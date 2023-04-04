import 'package:flutter/material.dart';
import 'package:gp/screens/login/login_screen.dart';
import 'package:gp/screens/register/register_screen.dart';
import 'package:gp/shared/components.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome!',

              style: TextStyle(color: textcolor,
              fontFamily: 'poppins',
              //height: 48,

              fontSize: 36,
              ),
            ),
            SizedBox(
              height: 26,
            ),
            defaultButton(
              function: (){
              navigateTo(context, LoginScreen());
            }, text: 'Sign in',
              height: 63,
              width: 236,
              radius: 45,
            ),
            SizedBox(height: 12),
            Text('OR',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 18,
                color: textcolor,
              ),
            ),
            SizedBox(height: 12,),
            defaultButton(function: (){

              navigateTo(context, RegisterScreen());
              }, text: 'Sign up',
            height: 63,
              width: 236,
              radius: 45,
            ),
          ],
        ),
      ),
    );
  }
}
