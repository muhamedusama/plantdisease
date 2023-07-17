import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gp/screens/login/login_screen.dart';
import 'package:gp/screens/model/cubit/cubit.dart';
import 'package:gp/screens/model/cubit/states.dart';
import 'package:gp/screens/model/home_screen.dart';
import 'package:gp/screens/model/model_screen.dart';
import 'package:gp/screens/register/cubit/cubit.dart';
import 'package:gp/screens/register/cubit/states.dart';
import 'package:gp/screens/welcome_screen/welcome_screen.dart';
import 'package:gp/shared/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:expandable_text/expandable_text.dart';

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
                                    fontSize: 15,
                                      fontFamily: 'poppins'
                                  ),
                                )
                            ),
                              top: 10,
                              left: 0,
                            )
                          ],
                        ),
                      
                       Container(
                         width: screenWidth,
                         height: screenHeight * 0.39205,
                         color: appbarcolor,
                         child: SingleChildScrollView(
                           child: Column(
                             children: [
                               SizedBox(height: 30,),
                               Image.asset(uploadedicons),
                               SizedBox(height: 10),
                               Text(

                                 predictiondisease,
                               style: TextStyle(fontFamily: 'poppins',
                               fontSize: 30,

                               ),

                               ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    severity
                                    ,
                                    style: TextStyle(fontFamily: 'poppins',
                                      fontSize: 25,


                                    ),

                                  ),
                                  Text(
                                    diseaseseverity
                                    ,
                                    style: TextStyle(fontFamily: 'poppins',
                                      fontSize: 25,
                                      color: severitycolor,


                                    ),



                                  ),
                                ],
                              ),
                               SizedBox(height: 25,),
                           GestureDetector(
                             onTap: (){
                            _showPopup(context);
                             }, // call _handleClick when the text is tapped
                             child: Text(
                               recommondedsolution,
                               style: TextStyle(
                                 fontSize: 25,
                                 color: Colors.black,
                                 decoration: TextDecoration.underline,
                               ),
                             )
                           ),
                             ],
                           ),
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


  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: backgroundcolor,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Recommended Solutions',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins',
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  treatment,
                  style: TextStyle(fontSize: 18,
                  fontFamily: 'poppins',
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: appbarcolor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Back',style: TextStyle(
                    fontFamily: 'poppins',
                    color: Colors.black,

                  ),),
                ),
              ],
            ),
          ),

        );
      },
    );
  }
