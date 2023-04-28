import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gp/screens/login/login_screen.dart';
import 'package:gp/screens/model/cubit/cubit.dart';
import 'package:gp/screens/model/cubit/states.dart';
import 'package:gp/screens/model/home_screen.dart';
import 'package:gp/screens/model/model_screen.dart';
import 'package:gp/screens/register/cubit/cubit.dart';
import 'package:gp/screens/register/cubit/states.dart';
import 'package:gp/shared/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class Prediction extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var phonecontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => modelcubit(),
      child: BlocConsumer< modelcubit,modelstates>(
        listener: (context, state) {
          print( modelcubit.get(context).modelImage);

        },
        builder: (context, state) {
          return  Scaffold(
            appBar: AppBar(
              leading: BackButton(
                onPressed: (){
                  navigateAndfFinish(context, ModelScreen());
                },
              ),
              backgroundColor: appbarcolor,
            ),
            backgroundColor: backgroundcolor,
            body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                   //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                     Stack(
                       children: <Widget>[
                         Image.file(
                           width: screenWidth-15,
                           height: screenHeight * 0.5,
                           // width: 400,
                           // height: 400,
                           uploadedimage,
                          fit: BoxFit.fitWidth,

                         ),
                         Positioned(child: Container(

                             padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                             decoration: BoxDecoration(
                               color: appbarcolor,
                               borderRadius: BorderRadius.circular(20.0),
                             ),
                             //color: Colors.white.withOpacity(1),
                             child: Text(predictionplant,
                             style: TextStyle(
                               fontSize: 10,
                             ),
                             )
                         ),
                        top: 15,
                           left: 0,
                         )
                       ],
                     ),

                Container(
                  width: screenWidth,
                  height: screenHeight * 0.39205,
                  color: appbarcolor,
                  child: Column(

                    children: [
                      SizedBox(height: 30,),
                      Image.asset(uploadedicons),
                      SizedBox(height: 10),
                      Text(predictiondisease,
                      style: TextStyle(fontFamily: 'poppins',
                      fontSize: 30,

                      ),
                      ),
                    ],
                  ),

                ),
            ]
          ),
            ),


          );
        },
      ),
    );
  }
}

