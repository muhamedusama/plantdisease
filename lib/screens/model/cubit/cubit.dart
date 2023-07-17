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
      ischecked=true;
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
      uploadedimage = File(modelImage.path);

      ischecked=true;
      emit(modelImagePickedSuccessState());
    } else
    {
      print('No image selected.');
      emit(modelImagePickedErrorState());
    }

    return modelImage;
  }

  uploadimage() async {
    ischecked=false;
    emit(modelloading());
    final request = await http.MultipartRequest("Post",Uri.parse("https://13c8-154-176-237-76.eu.ngrok.io/"));
    final headers = {"Content-type":"multipart/for-data"};
    request.files.add(
        http.MultipartFile('image',modelImage!.readAsBytes().asStream(),modelImage.lengthSync(),
            filename: modelImage.path.split("/").last));
    request.headers.addAll(headers);
    final response= await request.send();
    http.Response res = await http.Response.fromStream(response);
    final resJson=jsonDecode(res.body);
    var message=resJson['plantname'];
    var message2=resJson['diseasename'];
    var message3=resJson['treatment'];
    var msg4=resJson['severity'];

    predictionplant = message;
    predictiondisease=message2;
    treatment=message3;
    // severity+=msg4;
     if (msg4=="Invalid")
       {
         severity="";
         diseaseseverity="";
       }
    else if (msg4!="Invalid")
    {
      severity="Disease Severity: ";

       if (msg4=="Low")
     {
       severitycolor=Color(0xff5D9C59);
     }
      else if (msg4=="Medium")
      {
        severitycolor=Color(0xffF2BE22);
      }
       else if (msg4=="High")
       {
         severitycolor=Color(0xffF29727);
       }

      else if (msg4=="Very High")
      {
        severitycolor=Color(0xffCD1818);
      }
      diseaseseverity=msg4;

    }

    if (treatment!="Invalid")
      {
        recommondedsolution="Recommended Solutions ";
      }
    else
      {
        recommondedsolution="";
      }
    print("##########################################################################");
    print(treatment);
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