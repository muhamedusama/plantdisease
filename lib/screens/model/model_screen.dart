import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gp/screens/login/login_screen.dart';
import 'package:gp/screens/model/cubit/cubit.dart';
import 'package:gp/screens/model/cubit/states.dart';
import 'package:gp/screens/model/home_screen.dart';
import 'package:gp/screens/model/prediction.dart';
import 'package:gp/screens/register/cubit/cubit.dart';
import 'package:gp/screens/register/cubit/states.dart';
import 'package:gp/shared/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';

class ModelScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer< modelcubit,modelstates>(
        listener: (context, state) {
          if (predictionplant=="not defined")
          {
            uploadedicons='assets/cross_1.png';
          }
          else
          {
            uploadedicons='assets/pests_1_1.png';
          }
          if (state is modelloading)
            {
              navigateTo(context, animation());
            }
          if (state is modelpredictedsuccessfully)
            {
              navigateTo(context, Prediction());
            }

        },
        builder: (context, state) {
          var x = modelcubit.get(context).model;
          print(x.name!+"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa");
          return  Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.black54,
              backgroundColor: appbarcolor,

              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: Colors.black26,
                  icon: Icon(Icons.image),
                  label: 'gallery',
                  //backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(Icons.camera_alt_outlined),
                  label: 'camera',
                ),

              ],
            onTap: (int index){

           if (index==0)
             {
              modelcubit.get(context).getgalleryImage() as File;
             }
           else if (index==1)
             {
             modelcubit.get(context).openCamera() as File;
             }
           }
            ,
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
              child: Center(child: disabledbutton(
                function: ()
                {
                modelcubit.get(context).uploadimage();
              },

                text: 'predict the disease', height: 67,
                width: 291,
                radius: 14,
              ),
              ),
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

class animation extends StatelessWidget {
  const animation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      backgroundColor: backgroundcolor,
      body: SpinKitWave(
        color: appbarcolor,
      ),
      // color: Colors.white,
    );;

  }
}


