import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/screens/model/cubit/states.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class modelcubit extends Cubit<modelstates>
{
  //File modelImage;
  modelcubit() :super(modelinitialstate());
  static modelcubit get(context)=>BlocProvider.of(context);

  File modelImage = File('C:/Users/muham/Downloads');
  var picker = ImagePicker();

  Future<void> getgalleryImage() async
  {
    //File modelImage;
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null)
    {
      modelImage = File (pickedFile.path);
      emit(modelImagePickedSuccessState());
    } else
    {
      print('No image selected.');
      emit(modelImagePickedErrorState());
    }

  }

  void uploadimage()
  {
    firebase_storage. FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(modelImage.path).pathSegments.last}')
        .putFile(modelImage)
        .then((value) {
          value.ref.getDownloadURL().then((value) {
            print(value);
          }).catchError((error){});
    })
        .catchError((error){});
  }

}