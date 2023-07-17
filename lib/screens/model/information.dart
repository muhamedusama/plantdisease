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

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

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
                    Container(
                      width: 220,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text("  what is our application?",
                          style: TextStyle(
                            fontFamily: "poppins",
                            color: textcolor,
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
                Column(
                 // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: Text(" plant disease detection app that helps farmers to detect the diseases easily and faster. we have 14 plants and 26 different disease",
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
                          width: 220,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text("  Available Plants in the app",
                              style: TextStyle(
                                fontFamily: "poppins",
                                color: textcolor,
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
                    Padding(

                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //SizedBox(width: 25),
                          GestureDetector(
                            onTap:(){
                          launch('https://plantvillage.psu.edu/topics/tomato/infos');

                          },
                            child: Container(
                              width: 150, // Adjust the width of the square container
                              height: 50, // Adjust the height of the square container
                              decoration: BoxDecoration(
                                color: appbarcolor, // Specify the background color of the square container
                                borderRadius: BorderRadius.circular(16), // Adjust the border radius to control the roundness of the corners
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 Text("      "),
                                  Image.asset(
                                    'assets/tomato.png', // Replace with your image path
                                    width: 32, // Adjust the width of the image
                                    height: 32, // Adjust the height of the image
                                  ),
                                  SizedBox(width: 8), // Add some spacing between the image and text field
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(color: Colors.white), // Specify the text color
                                      decoration: InputDecoration(
                                        border: InputBorder.none, // Remove the default border
                                        hintText: 'Tomato', // Placeholder text
                                        hintStyle: TextStyle(color: textcolor), // Specify the placeholder text color
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 25),
                          GestureDetector(
                            onTap: ()
                            {
                              launch("https://plantvillage.psu.edu/topics/cherry-including-sour/infos");
                            },
                            child: Container(
                              width: 150, // Adjust the width of the square container
                              height: 50, // Adjust the height of the square container
                              decoration: BoxDecoration(
                                color: appbarcolor, // Specify the background color of the square container
                                borderRadius: BorderRadius.circular(16), // Adjust the border radius to control the roundness of the corners
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("      "),
                                  Image.asset(
                                    'assets/cherry1.png', // Replace with your image path
                                    width: 32, // Adjust the width of the image
                                    height: 32, // Adjust the height of the image
                                  ),
                                  SizedBox(width: 8), // Add some spacing between the image and text field
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(color: Colors.white), // Specify the text color
                                      decoration: InputDecoration(
                                        border: InputBorder.none, // Remove the default border
                                        hintText: 'Cherry', // Placeholder text
                                        hintStyle: TextStyle(color: textcolor), // Specify the placeholder text color
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(

                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //SizedBox(width: 25),
                          GestureDetector(
                            onTap:(){
                              launch("https://bonnieplants.com/blogs/how-to-grow/growing-corn#:~:text=Corn%20will%20grow%20quickly%20when,soil%20moist%20and%20prevent%20weeds.");
                          },
                            child: Container(
                              width: 150, // Adjust the width of the square container
                              height: 50, // Adjust the height of the square container
                              decoration: BoxDecoration(
                                color: appbarcolor, // Specify the background color of the square container
                                borderRadius: BorderRadius.circular(16), // Adjust the border radius to control the roundness of the corners
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("         "),
                                  Image.asset(
                                    'assets/corn.png', // Replace with your image path
                                    width: 32, // Adjust the width of the image
                                    height: 32, // Adjust the height of the image
                                  ),
                                  SizedBox(width: 8), // Add some spacing between the image and text field
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(color: Colors.white), // Specify the text color
                                      decoration: InputDecoration(
                                        border: InputBorder.none, // Remove the default border
                                        hintText: 'Corn', // Placeholder text
                                        hintStyle: TextStyle(color: textcolor), // Specify the placeholder text color
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 25),
                          GestureDetector(
                            onTap: ()
                            {
                              launch("https://plantvillage.psu.edu/topics/grape/infos");
                            },
                            child: Container(
                              width: 150, // Adjust the width of the square container
                              height: 50, // Adjust the height of the square container
                              decoration: BoxDecoration(
                                color: appbarcolor, // Specify the background color of the square container
                                borderRadius: BorderRadius.circular(16), // Adjust the border radius to control the roundness of the corners
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("      "),
                                  Image.asset(
                                    'assets/vecteezy_grape-png-graphic-clipart-design_19614439_161.png', // Replace with your image path
                                    width: 32, // Adjust the width of the image
                                    height: 32, // Adjust the height of the image
                                  ),
                                  SizedBox(width: 8), // Add some spacing between the image and text field
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(color: Colors.white), // Specify the text color
                                      decoration: InputDecoration(
                                        border: InputBorder.none, // Remove the default border
                                        hintText: 'Grape', // Placeholder text
                                        hintStyle: TextStyle(color: textcolor), // Specify the placeholder text color
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(

                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //SizedBox(width: 25),
                          GestureDetector(
                            onTap:(){
                              launch("https://plantvillage.psu.edu/topics/orange/infos");
                            },
                            child: Container(
                              width: 150, // Adjust the width of the square container
                              height: 50, // Adjust the height of the square container
                              decoration: BoxDecoration(
                                color: appbarcolor, // Specify the background color of the square container
                                borderRadius: BorderRadius.circular(16), // Adjust the border radius to control the roundness of the corners
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("      "),
                                  Image.asset(
                                    'assets/orange.png', // Replace with your image path
                                    width: 32, // Adjust the width of the image
                                    height: 32, // Adjust the height of the image
                                  ),
                                  SizedBox(width: 8), // Add some spacing between the image and text field
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(color: Colors.white), // Specify the text color
                                      decoration: InputDecoration(
                                        border: InputBorder.none, // Remove the default border
                                        hintText: 'Orange', // Placeholder text
                                        hintStyle: TextStyle(color: textcolor), // Specify the placeholder text color
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 25),
                          GestureDetector(
                            onTap:(){
                              launch("https://plantvillage.psu.edu/topics/peach/infos");
                            },
                            child: Container(
                              width: 150, // Adjust the width of the square container
                              height: 50, // Adjust the height of the square container
                              decoration: BoxDecoration(
                                color: appbarcolor, // Specify the background color of the square container
                                borderRadius: BorderRadius.circular(16), // Adjust the border radius to control the roundness of the corners
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("      "),
                                  Image.asset(
                                    'assets/peach.png', // Replace with your image path
                                    width: 32, // Adjust the width of the image
                                    height: 32, // Adjust the height of the image
                                  ),
                                  SizedBox(width: 8), // Add some spacing between the image and text field
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(color: Colors.white), // Specify the text color
                                      decoration: InputDecoration(
                                        border: InputBorder.none, // Remove the default border
                                        hintText: 'Peach', // Placeholder text
                                        hintStyle: TextStyle(color: textcolor), // Specify the placeholder text color
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(

                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //SizedBox(width: 25),
                          GestureDetector(
                            onTap:(){
                              launch("https://plantvillage.psu.edu/topics/raspberry/infos");
                            },
                            child: Container(
                              width: 150, // Adjust the width of the square container
                              height: 50, // Adjust the height of the square container
                              decoration: BoxDecoration(
                                color: appbarcolor, // Specify the background color of the square container
                                borderRadius: BorderRadius.circular(16), // Adjust the border radius to control the roundness of the corners
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("      "),
                                  Image.asset(
                                    'assets/raspberry.png', // Replace with your image path
                                    width: 32, // Adjust the width of the image
                                    height: 32, // Adjust the height of the image
                                  ),
                                  SizedBox(width: 8), // Add some spacing between the image and text field
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(color: Colors.white), // Specify the text color
                                      decoration: InputDecoration(
                                        border: InputBorder.none, // Remove the default border
                                        hintText: 'Raspberry', // Placeholder text
                                        hintStyle: TextStyle(color: textcolor), // Specify the placeholder text color
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 25),
                          GestureDetector(
                            onTap:(){
                              launch("https://plantvillage.psu.edu/topics/strawberry/infos");
                            },
                            child: Container(
                              width: 150, // Adjust the width of the square container
                              height: 50, // Adjust the height of the square container
                              decoration: BoxDecoration(
                                color: appbarcolor, // Specify the background color of the square container
                                borderRadius: BorderRadius.circular(16), // Adjust the border radius to control the roundness of the corners
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("      "),
                                  Image.asset(
                                    'assets/strawberry.png', // Replace with your image path
                                    width: 32, // Adjust the width of the image
                                    height: 32, // Adjust the height of the image
                                  ),
                                  SizedBox(width: 8), // Add some spacing between the image and text field
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(color: Colors.white), // Specify the text color
                                      decoration: InputDecoration(
                                        border: InputBorder.none, // Remove the default border
                                        hintText: 'Strawberry', // Placeholder text
                                        hintStyle: TextStyle(color: textcolor), // Specify the placeholder text color
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(

                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //SizedBox(width: 25),
                          GestureDetector(
                            onTap:(){
                              launch("https://plantvillage.psu.edu/topics/squash/infos");
                            },
                            child: Container(
                              width: 150, // Adjust the width of the square container
                              height: 50, // Adjust the height of the square container
                              decoration: BoxDecoration(
                                color: appbarcolor, // Specify the background color of the square container
                                borderRadius: BorderRadius.circular(16), // Adjust the border radius to control the roundness of the corners
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("      "),
                                  Image.asset(
                                    'assets/squash.png', // Replace with your image path
                                    width: 32, // Adjust the width of the image
                                    height: 32, // Adjust the height of the image
                                  ),
                                  SizedBox(width: 8), // Add some spacing between the image and text field
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(color: Colors.white), // Specify the text color
                                      decoration: InputDecoration(
                                        border: InputBorder.none, // Remove the default border
                                        hintText: 'Squash', // Placeholder text
                                        hintStyle: TextStyle(color: textcolor), // Specify the placeholder text color
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 25),
                          GestureDetector(
                            onTap:(){
                              launch("https://plantvillage.psu.edu/topics/soybean/infos");
                            },
                            child: Container(
                              width: 150, // Adjust the width of the square container
                              height: 50, // Adjust the height of the square container
                              decoration: BoxDecoration(
                                color: appbarcolor, // Specify the background color of the square container
                                borderRadius: BorderRadius.circular(16), // Adjust the border radius to control the roundness of the corners
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("      "),
                                  Image.asset(
                                    'assets/soybean.png', // Replace with your image path
                                    width: 32, // Adjust the width of the image
                                    height: 32, // Adjust the height of the image
                                  ),
                                  SizedBox(width: 8), // Add some spacing between the image and text field
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(color: Colors.white), // Specify the text color
                                      decoration: InputDecoration(
                                        border: InputBorder.none, // Remove the default border
                                        hintText: 'Soybean', // Placeholder text
                                        hintStyle: TextStyle(color: textcolor), // Specify the placeholder text color
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(

                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //SizedBox(width: 25),
                          GestureDetector(
                            onTap:(){
                              launch("https://plantvillage.psu.edu/topics/pepper-bell/infos");
                            },
                            child: Container(
                              width: 150, // Adjust the width of the square container
                              height: 50, // Adjust the height of the square container
                              decoration: BoxDecoration(
                                color: appbarcolor, // Specify the background color of the square container
                                borderRadius: BorderRadius.circular(16), // Adjust the border radius to control the roundness of the corners
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("      "),
                                  Image.asset(
                                    'assets/pepperbell.png', // Replace with your image path
                                    width: 32, // Adjust the width of the image
                                    height: 32, // Adjust the height of the image
                                  ),
                                  SizedBox(width: 8), // Add some spacing between the image and text field
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(color: Colors.white), // Specify the text color
                                      decoration: InputDecoration(
                                        border: InputBorder.none, // Remove the default border
                                        hintText: 'Bell Pepper', // Placeholder text
                                        hintStyle: TextStyle(color: textcolor), // Specify the placeholder text color
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 25),
                          GestureDetector(
                            onTap:(){
                              launch("https://plantvillage.psu.edu/topics/potato/infos");
                            },
                            child: Container(
                              width: 150, // Adjust the width of the square container
                              height: 50, // Adjust the height of the square container
                              decoration: BoxDecoration(
                                color: appbarcolor, // Specify the background color of the square container
                                borderRadius: BorderRadius.circular(16), // Adjust the border radius to control the roundness of the corners
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("      "),
                                  Image.asset(
                                    'assets/potato1.png', // Replace with your image path
                                    width: 32, // Adjust the width of the image
                                    height: 32, // Adjust the height of the image
                                  ),
                                  SizedBox(width: 8), // Add some spacing between the image and text field
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(color: Colors.white), // Specify the text color
                                      decoration: InputDecoration(
                                        border: InputBorder.none, // Remove the default border
                                        hintText: 'Potato', // Placeholder text
                                        hintStyle: TextStyle(color: textcolor), // Specify the placeholder text color
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(

                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //SizedBox(width: 25),
                          GestureDetector(
                            onTap:(){
                              launch("https://plantvillage.psu.edu/topics/apple/infos");
                            },
                            child: Container(
                              width: 150, // Adjust the width of the square container
                              height: 50, // Adjust the height of the square container
                              decoration: BoxDecoration(
                                color: appbarcolor, // Specify the background color of the square container
                                borderRadius: BorderRadius.circular(16), // Adjust the border radius to control the roundness of the corners
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("      "),
                                  Image.asset(
                                    'assets/apple.png', // Replace with your image path
                                    width: 32, // Adjust the width of the image
                                    height: 32, // Adjust the height of the image
                                  ),
                                  SizedBox(width: 8), // Add some spacing between the image and text field
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(color: Colors.white), // Specify the text color
                                      decoration: InputDecoration(
                                        border: InputBorder.none, // Remove the default border
                                        hintText: 'Apple', // Placeholder text
                                        hintStyle: TextStyle(color: textcolor), // Specify the placeholder text color
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 25),
                          GestureDetector(
                            onTap:(){
                              launch("https://plantvillage.psu.edu/topics/blueberry/infos");
                            },
                            child: Container(
                              width: 150, // Adjust the width of the square container
                              height: 50, // Adjust the height of the square container
                              decoration: BoxDecoration(
                                color: appbarcolor, // Specify the background color of the square container
                                borderRadius: BorderRadius.circular(16), // Adjust the border radius to control the roundness of the corners
                              ),

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("      "),
                                  Image.asset(
                                    'assets/blueberry.png', // Replace with your image path
                                    width: 32, // Adjust the width of the image
                                    height: 32, // Adjust the height of the image
                                  ),
                                  SizedBox(width: 8), // Add some spacing between the image and text field
                                  Expanded(
                                    child: TextField(
                                      style: TextStyle(color: Colors.white), // Specify the text color
                                      decoration: InputDecoration(
                                        border: InputBorder.none, // Remove the default border
                                        hintText: 'Blueberry', // Placeholder text
                                        hintStyle: TextStyle(color: textcolor), // Specify the placeholder text color
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 15,),


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



