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
    return BlocProvider(
      create: (BuildContext context) => modelcubit(),
      child: BlocConsumer< modelcubit,modelstates>(
        listener: (context, state) {
          print("helloooooooooooooo");
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

                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Image.file(uploadedimage),
                Text(prediction),
            ]
          ),
            ),


          );
        },
      ),
    );
  }
}

