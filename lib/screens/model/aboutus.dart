import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/screens/login/login_screen.dart';
import 'package:gp/screens/model/cubit/cubit.dart';
import 'package:gp/screens/model/cubit/states.dart';
import 'package:gp/screens/model/model_screen.dart';
import 'package:gp/shared/components.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<modelcubit,modelstates>(
      listener: (context,states){
      },
      builder: (context,states){
        var x = modelcubit.get(context).model;
        print("oooooooooooooooooooooo" + x.name!);

        return  Scaffold(

          backgroundColor: backgroundcolor,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: appbarcolor,

          ),
          body: SingleChildScrollView(
            child: Column(

              children: [
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                  ],
                ),

                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(" Our team consists of five passionate computer science students, who are keen on using technology to improve agricultural sustainability. Our mission is to provide farmers with reliable, efficient, and cost-effective tools to help them manage plant disease and ultimately improve their crop yields.",
                        style: TextStyle(
                          fontFamily: "poppins",
                          color: textcolor,
                        ),
                      ),


                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Container(

                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text("  team members",
                              style: TextStyle(
                                fontFamily: "poppins",
                                color: textcolor,
                                fontSize: 20
                              ),
                            ),
                          ),

                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Divider(
                        color: textcolor,
                        thickness: 1,
                      ),

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 50, // Adjust the radius of the circle
                              backgroundImage: AssetImage('assets/uss.jpg'), // Replace with your image path

                            ),
                            SizedBox(height: 5),
                            Text("Muhamed Usama",
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 50,),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 50, // Adjust the radius of the circle
                              backgroundImage: AssetImage('assets/WhatsApp Image 2023-07-05 at 8.30.18 PM.jpeg'), // Replace with your image path

                            ),
                            SizedBox(height: 5),
                            Text("Mariam Swelam",
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 50, // Adjust the radius of the circle
                              backgroundImage: AssetImage('assets/roshdy.jpeg'), // Replace with your image path

                            ),
                            SizedBox(height: 5),
                            Text("Mariam Roshdy",
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 50,),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 50, // Adjust the radius of the circle
                              backgroundImage: AssetImage('assets/WhatsApp Image 2023-07-05 at 8.22.55 PM.jpeg'), // Replace with your image path

                            ),
                            SizedBox(height: 5),
                            Text("Merna Gameel",
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 50, // Adjust the radius of the circle
                              backgroundImage: AssetImage('assets/WhatsApp Image 2023-07-04 at 11.36.23 AM.jpeg'), // Replace with your image path

                            ),
                            SizedBox(height: 5),
                            Text("Amr Ezzat",
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                      ],
                    )


                  ],
                ),

              ],
            ),
          ),




        );
      },

    );


  }
}



