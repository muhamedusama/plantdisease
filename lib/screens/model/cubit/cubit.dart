import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/screens/model/cubit/states.dart';
import 'package:image_picker/image_picker.dart';

class modelcubit extends Cubit<modelstates>
{

  modelcubit():super(modelinitialstate());
  //LoginCubit(): super(LoginInitialStates());


  //modelCubit(super.initialState);
  static modelcubit get(context)=>BlocProvider.of(context);

  //File modelImage;
  var picker = ImagePicker();
  Future<void> getProfileImage() async
  {
    final pickedFile = await picker.getImage (
      source: ImageSource.gallery,
    );
    if (pickedFile != null)
    {
      File modelImage = File (pickedFile.path);
      emit(modelImagePickedSuccessState());
    } else
    {
      print('No image selected.');
      emit(modelImagePickedErrorState());
    }
  }
}