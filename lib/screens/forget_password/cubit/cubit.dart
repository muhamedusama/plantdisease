import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:gp/screens/forget_password/cubit/states.dart';
import 'package:gp/screens/login/cubit/states.dart';
import 'package:gp/shared/components.dart';

class ForgetCubit extends Cubit<ForgetStates> {

  ForgetCubit() : super(ForgetInitialStates());
  static ForgetCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
  }) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).
    then((value) => emit(ForgetSuccessStates())).
    onError((error, stackTrace) => emit(ForgetErrorStates(error.toString())));
    //emit(ForgetSuccessStates());
  }
}