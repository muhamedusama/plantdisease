import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/screens/model/cubit/states.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class modelcubit extends Cubit<modelstates>
{

  //File modelImage;
  modelcubit() :super(modelinitialstate());
  static modelcubit get(context)=>BlocProvider.of(context);

  File modelImage = File('/data/user/0/com.example.gp/cache/f89b0a5c-ef3a-4da1-b28e-7400cb73452f/1000049145.jpg');
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
      print(modelImage.path);
      emit(modelImagePickedSuccessState());
    } else
    {
      print('No image selected.');
      emit(modelImagePickedErrorState());
    }


  }
  uploadimage() async {
    //File? selectedimage;
    String message='';
    final request = await http.MultipartRequest("Post",Uri.parse("https://421b-197-47-80-221.eu.ngrok.io/"));
    final headers = {"Content-type":"multipart/for-data"};
    request.files.add(
        http.MultipartFile('image',modelImage!.readAsBytes().asStream(),modelImage.lengthSync(),
            filename: modelImage.path.split("/").last));
    request.headers.addAll(headers);
    final response= await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson=jsonDecode(res.body);
    message=resJson['message'];
    print("############################################################"+message);
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