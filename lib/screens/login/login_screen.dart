import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/screens/login/cubit/states.dart';
import 'package:gp/screens/register/register_screen.dart';
import 'package:gp/shared/components.dart';
import 'package:gp/screens/login/cubit/cubit.dart';

import '../model/home_screen.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailcontroller = TextEditingController();
    var passcontroller = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorStates)
            {
              print('usos');
              showToast (text: state.error, state: ToastStates. ERROR);
            }
          if (state is LoginSuccessStates)
          {
            navigateTo(context, HomeScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: backgroundcolor,
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Form(
                    key: formKey,
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Sign in',
                          style: TextStyle(
                            color: textcolor,
                            fontSize: 36,
                            fontFamily: 'poppins'
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ), //
                        SizedBox(
                          height: 40,
                        ), //
                        defaultTextForm(
                          controller: emailcontroller,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ), // Text
                        SizedBox(
                          height: 10,
                        ),
                        defaultTextForm(
                          controller: passcontroller,
                          type: TextInputType.visiblePassword,
                          suffix: LoginCubit.get(context).suffix,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          ispassword: LoginCubit.get(context).isPassword,
                          suffixPressed: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                          label: 'Password',
                          prefix: Icons.lock_outlined,
                        ), // Text
                        SizedBox(
                          height: 50,
                        ),
                        ConditionalBuilder(
                          condition:state is! LoginLoadingStates,
                          builder:(context)=>  defaultButton(
                            radius: 45,
                            height: 36,
                            width: 236,
                            function: () {

                              if(formKey.currentState!.validate())
                              {
                                //emit(LoginInitialStates());
                                LoginCubit.get(context).userLogin

                                  (
                                  email: emailcontroller.text,
                                  password: passcontroller.text,
                                );


                              }
                            }, text: 'Sign in', upper: true,
                          ), fallback: (context) =>CircularProgressIndicator() ,
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            defaultTextButton(
                                function: () {
                                  navigateTo(context, RegisterScreen());
                                },
                                text: 'forgot your password?'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
             // Column
          );
        },
      ),
    ); // Scaffold
  }
}
