import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp/shared/components.dart';
import 'package:image_picker/image_picker.dart';

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

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
          children: [
              defaultButton(function: (){}
                  , text: 'model')
          ],
        ),
      ),
    );
  }
}



