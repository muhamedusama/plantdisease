import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gp/screens/login/login_screen.dart';
import 'package:gp/screens/model/cubit/cubit.dart';
import 'package:gp/screens/model/cubit/states.dart';
import 'package:gp/screens/register/cubit/cubit.dart';
import 'package:gp/screens/register/cubit/states.dart';
import 'package:gp/shared/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class ModelScreen extends StatelessWidget {
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
        },
        builder: (context, state) {
          return  Scaffold(
            appBar: AppBar(
              backgroundColor: appbarcolor,
            ),
            backgroundColor: backgroundcolor,
            body: Container(
              child: Center(child: defaultButton(function: (){
                navigateTo(context, ModelScreen());
              },
                text: 'predict the disease', height: 67,
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
          );;
        },
      ),
    );
  }
}

