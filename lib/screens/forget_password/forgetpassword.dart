import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/screens/forget_password/cubit/cubit.dart';
import 'package:gp/screens/forget_password/cubit/states.dart';
import 'package:gp/screens/login/login_screen.dart';
import 'package:gp/screens/model/home_screen.dart';
import 'package:gp/shared/components.dart';
class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailcontrol = TextEditingController();
    return BlocProvider(
      create: (BuildContext context)=>ForgetCubit(),
      child:BlocConsumer<ForgetCubit,ForgetStates>(
        listener: (context,state)
        {
          if (state is ForgetSuccessStates)
          {
            showToast(text: 'your password reset email sent successfully', color: Colors.green, state: ToastStates.ERROR);
            navigateTo(context, LoginScreen());
          }

        },
        builder: (context,state)
        {
          return Scaffold(
            backgroundColor: backgroundcolor,
            body: Form(
              key:formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  defaultTextForm(
                      controller: emailcontrol,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email address';
                        }
                        if (!isEmail(value)) {
                          return 'Please enter a valid email';
                        }
                      },
                      label: 'Email Adress',
                      prefix: Icons.email),
                  defaultButton(
                    radius: 45,
                    height: 36,
                    width: 236,
                    function: () {
                      if(formKey.currentState!.validate())
                      {
                        ForgetCubit.get(context).userLogin(email: emailcontrol.text);
                      }
                    }, text: 'Sign in', upper: true,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}