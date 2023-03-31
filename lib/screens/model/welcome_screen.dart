import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/screens/model/cubit/cubit.dart';
import 'package:gp/screens/model/cubit/states.dart';
import 'package:gp/shared/components.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    File image;
    var picker = ImagePicker();

    Future<void> getImage() async
    {
      final pickedfile = await picker.getImage(
        source: ImageSource.gallery,
      );
      if (pickedfile != null) {
        image = File(pickedfile.path);
      } else
        print('No image selected.');
    }
    return BlocProvider(
        create: (BuildContext context) => modelcubit(),
        child: BlocConsumer<modelcubit, modelstates>(
            listener: (context, state) {

            },
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.file(modelcubit.get(context).modelImage),
                      defaultButton(function: () async {
                        modelcubit.get(context).getgalleryImage();


                      }, text: 'upload image'),
                      defaultButton(function: () async {
                        modelcubit.get(context).uploadimage();


                      }, text: 'predict'),
                     Text("prediction: "+ prediction),

                    ],
                  ),
                ),
              );
            }
        )
    );
  }
}



