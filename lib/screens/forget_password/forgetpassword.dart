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
          if (state is ForgetErrorStates)
          {
            showToast(text: "PLEASE ENTER YOUR CORRECT MAIL", color: Colors.red, state: ToastStates.ERROR);

          }

        },
        builder: (context,state)
        {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: appbarcolor,
            ),
            backgroundColor: backgroundcolor,
            body: Form(
              key:formKey,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 95,),
                    Container(
                      height: 163,
                        width: 165,

                        child: Image.asset('assets/user.png')

                    ),
                    SizedBox(height: 75,),
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
                    SizedBox(height: 20,),
                    defaultButton(
                      radius: 5,
                      height: 58,
                      width: 380,
                      function: () {
                        if(formKey.currentState!.validate())
                        {
                          ForgetCubit.get(context).userLogin(email: emailcontrol.text);
                        }
                      }, text: 'send verification Email', upper: false,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}