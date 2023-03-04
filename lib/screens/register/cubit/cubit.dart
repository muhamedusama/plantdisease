import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:gp/screens/login/cubit/states.dart';
import 'package:gp/screens/register/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterCubit extends Cubit<RegisterStates>
{

  RegisterCubit(): super(RegisterInitialStates());
  static RegisterCubit get(context)=>BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  })
  {
    print('hello');
    emit(RegisterLoadingStates());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,).then ((value) {
          print(value.user!.email);
          emit(RegisterSuccessStates());
    })
        .catchError((error){
          emit(RegisterErrorStates(error.toString()));
    });
  }

  IconData suffix=Icons.visibility_outlined;
  bool isPassword=true;
  void changePasswordVisibility (){
    isPassword=!isPassword ;
    suffix=isPassword?Icons.visibility_outlined: Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityStates());
  }
 }