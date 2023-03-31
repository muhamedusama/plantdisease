import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/screens/login/cubit/states.dart';
import 'package:gp/screens/register/register_screen.dart';
import 'package:gp/shared/components.dart';
import 'package:gp/screens/login/cubit/cubit.dart';

import '../model/welcome_screen.dart';
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
            navigateTo(context, WelcomeScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Form(
                    key: formKey,
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ), //
                        Text(
                          'login now to try our model',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.grey,
                              ),
                        ),
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
                          height: 10,
                        ),
                        ConditionalBuilder(
                          condition:state is! LoginLoadingStates,
                          builder:(context)=>  defaultButton(
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
                            }, text: 'login', upper: true,
                          ), fallback: (context) =>CircularProgressIndicator() ,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\`t have an account?'),
                            defaultTextButton(
                                function: () {
                                  navigateTo(context, RegisterScreen());
                                },
                                text: 'register'),
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
