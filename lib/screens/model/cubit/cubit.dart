import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/screens/model/cubit/states.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../models/users_model/userModel.dart';
import '../../../shared/components.dart';

class modelcubit extends Cubit<modelstates>
{

  File modelImage = File('');
  modelcubit() :super(modelinitialstate());
  static modelcubit get(context)=>BlocProvider.of(context);

  userModel model = userModel(name: '', email: '', phone: '', uId: '');

  void getUserData()
  {
    emit(GetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(token).get().then((value){
      model = userModel.fromJson(value.data()!);
      print("#################"+ model.name!);

      emit(GetUserSuccessState());

    }).catchError((error){
      emit(GetUserErrorState(error.toString()));
    });
  }

  //File modelImage = File('');
  var picker = ImagePicker();

  Future<File> getgalleryImage() async
  {
    //File modelImage=File('');
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null)
    {
      modelImage = File (pickedFile.path);
      print("hellooooooooooo==========="+modelImage.path);
      uploadedimage = File(modelImage.path);
      emit(modelImagePickedSuccessState());
    } else
    {
      print('No image selected.');
      emit(modelImagePickedErrorState());
    }

  return modelImage;
  }

  Future<File> openCamera() async
  {
    //File modelImage=File('');
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
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

    return modelImage;
  }

  uploadimage() async {
    emit(modelloading());
    String message='';
    final request = await http.MultipartRequest("Post",Uri.parse("http://7697-35-227-127-158.ngrok.io"));
    final headers = {"Content-type":"multipart/for-data"};
    request.files.add(
        http.MultipartFile('image',modelImage!.readAsBytes().asStream(),modelImage.lengthSync(),
            filename: modelImage.path.split("/").last));
    request.headers.addAll(headers);
    final response= await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson=jsonDecode(res.body);
    message=resJson['message'];
    var message2=resJson['plantname'];
    print(message2);
    print("the prediction is :::::::::::::::::::::"+message);
    prediction = message;
    emit(modelpredictedsuccessfully());
  }




  // var url;
  // void uploadimage()
  // {
  //   firebase_storage. FirebaseStorage.instance
  //       .ref()
  //       .child('users/${Uri.file(modelImage.path).pathSegments.last}')
  //       .putFile(modelImage)
  //       .then((value) {
  //         value.ref.getDownloadURL().then((value) {
  //           print(value);
  //           url=value;
  //         }).catchError((error){});
  //   })
  //       .catchError((error){});
  // }

}