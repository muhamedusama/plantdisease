import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gp/screens/login/login_screen.dart';
import 'package:gp/screens/register/cubit/cubit.dart';
import 'package:gp/screens/register/cubit/states.dart';
import 'package:gp/shared/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterErrorStates)
          {
            showToast (text: state.error, state: ToastStates. ERROR);
          }
          if (state is RegisterSuccessStates)
          {navigateAndfFinish(context, LoginScreen());}
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
                          'Sign up',
                          style: TextStyle(
                            color: textcolor,
                            fontSize: 36,
                          ),
                        ),
                        SizedBox(
                          height: 58,
                        ), //

                        defaultTextForm(
                          controller: namecontroller,
                          type: TextInputType.name,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your name';
                            }
                          },
                          label: 'Username',
                          prefix: Icons.person,
                        ), // Text
                        SizedBox(
                          height: 10,
                        ),
                        defaultTextForm(
                          controller: emailcontroller,
                          type: TextInputType.emailAddress,
                          validate: (value) {
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
                          controller: passwordcontroller,
                          type: TextInputType.visiblePassword,
                          suffix: RegisterCubit
                              .get(context)
                              .suffix,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          ispassword: RegisterCubit
                              .get(context)
                              .isPassword,
                          suffixPressed: () {
                            RegisterCubit.get(context).changePasswordVisibility();
                          },
                          label: 'Password',
                          prefix: Icons.lock_outlined,
                        ), // Text
                        SizedBox(
                          height: 10,
                        ),
                        defaultTextForm(
                          controller: phonecontroller,
                          type: TextInputType.phone,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your phone number';
                            }
                          },
                          label: 'Phone number',
                          prefix: Icons.phone,
                        ), // Text
                        SizedBox(
                          height: 40,
                        ),
                    ConditionalBuilder(
                          condition:state is! RegisterLoadingStates,
                          builder:(context)=>  defaultButton(
                            radius: 45,
                            height: 42,
                            width: 204,
                            function: () {
                              if(formKey.currentState!.validate())
                              {
                                RegisterCubit.get(context).userRegister

                                  (name: namecontroller.text,
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text,
                                  phone: phonecontroller.text,
                                );

                              }
                            }, text: 'Register', upper: true,
                          ), fallback: (context) =>CircularProgressIndicator() ,
                        ),

                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

