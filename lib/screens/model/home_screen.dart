import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/screens/login/login_screen.dart';
import 'package:gp/screens/model/aboutus.dart';
import 'package:gp/screens/model/cubit/cubit.dart';
import 'package:gp/screens/model/cubit/states.dart';
import 'package:gp/screens/model/information.dart';
import 'package:gp/screens/model/model_screen.dart';
import 'package:gp/screens/welcome_screen/welcome_screen.dart';
import 'package:gp/shared/components.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<modelcubit,modelstates>(
        listener: (context,states){
        },
        builder: (context,states){
          var x = modelcubit.get(context).model;
          print("oooooooooooooooooooooo" + x.name!);

          return  Scaffold(
            drawer: NavigationDrawer(children: [
              Container(
                height: 80,
                child: UserAccountsDrawerHeader(
                  // currentAccountPicture: CircleAvatar(
                  //
                  //     child: Image(image: AssetImage("assets/tomato.png")),
                  //
                  // ),
                  accountName: Text('${x.name}',style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),),
                  accountEmail: Text('${x.email}',style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),),
                decoration: BoxDecoration(
                  color: Color(0xffAAC8A7),
                ),
                ),
              )
              ,ListTile(
                leading: Icon(Icons.info_outline,color: Colors.black,),
                title: Text('Information',style: TextStyle(
                  fontSize: 18,
                ),),
                onTap: (){
                  navigateTo(context, Information());
                }
              ),
              ListTile(
                  leading: Icon(Icons.groups,color: Colors.black,),
                  title: Text('About Us',style: TextStyle(
                    fontSize: 18,
                  ),),
                  onTap: (){
                    navigateTo(context, Aboutus());
                  }
              ),
              ListTile(
                  leading: Icon(Icons.logout,color: Colors.black,),
                  title: Text('Logout',style: TextStyle(
                    fontSize: 18,
                  ),),
                  onTap: (){
                    navigateTo(context, WelcomeScreen());
                  }
              ),
              // ListTile(
              //     leading: Icon(Icons.info_outline),
              //     title: Text('trial'),
              //     onTap: (){
              //      // navigateTo(context, LoginScreen());
              //     },
              //   splashColor: Colors.white,
              // ),
            ],
              backgroundColor: appbarcolor,
            ),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              actions: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${x.name}'
                      ,style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'poppins'),),
                  ],
                )
                ,IconButton(icon: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black,
                ), onPressed: () { },)
              ],

              backgroundColor: appbarcolor,
            ),
            backgroundColor: backgroundcolor,
            body: Container(
              child: Center(child: defaultButton(function: (){
                // modelcubit.get(context).getgalleryImage();
                //
                // modelcubit.get(context).uploadimage();
                navigateTo(context, ModelScreen());
              },
                text: 'detect your plant disease', height: 67,
                width: 291,
                radius: 14,
              )),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/editplant.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),


          );
        },

      );


  }
}



