import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:gp/screens/login/cubit/states.dart';

class LoginCubit extends Cubit<LoginStates>
{

  LoginCubit(): super(LoginInitialStates());
  static LoginCubit get(context)=>BlocProvider.of(context);
  void userLogin({
    required String email,
    required String password,
}){
    emit(LoginLoadingStates());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email
        , password: password).then((value) {
      emit(LoginSuccessStates(value.user!.uid));

    }).catchError((error){
      emit(LoginErrorStates(error.toString()));
    });
  }


  IconData suffix=Icons.visibility_outlined;
  bool isPassword=true;
  void changePasswordVisibility (){
    isPassword=!isPassword ;
    suffix=isPassword?Icons.visibility_outlined: Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityStates());
  }
 }