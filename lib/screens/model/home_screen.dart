import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/screens/model/cubit/cubit.dart';
import 'package:gp/screens/model/cubit/states.dart';
import 'package:gp/screens/model/model_screen.dart';
import 'package:gp/shared/components.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(children: [Text('sss'),Text('dddddd')],
        backgroundColor: appbarcolor,
      ),
      appBar: AppBar(
        backgroundColor: appbarcolor,
      ),
      backgroundColor: backgroundcolor,
      body: Container(
        child: Center(child: defaultButton(function: (){
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
  }
}



