//import 'package:first_app/shared/styles/icon_broken.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:fluttertoast/fluttertoast.dart';
String predictionplant = "";
String predictiondisease = "";
String treatment = "";

String severity="";
String diseaseseverity="";
String? token = "";
File uploadedimage=File('');
String uploadedicons='';
bool ischecked=false;
String recommondedsolution="";
Color backgroundcolor=Color(0xffE9EFC0);
Color textcolor=Color(0xff2C5611);
Color iconscolor=Color(0xff83BD75);
Color appbarcolor=Color(0xffB4E197);
Color severitycolor=Color(0xffE9EFC0);




//final username;
Widget defaultButton({
  //double width = double.infinity,
  Color background = Colors.teal,
  required Function function,
  bool upper = true,
  required String text,
  required double height,
  required double width,
  required double radius,
}) => Container(
  decoration: BoxDecoration(
    color: Color(0xff4E944F),
    borderRadius: BorderRadius.circular(radius),
  ),
  width: width,
  height: height,
  //color: background,
  child: MaterialButton(
    shape: RoundedRectangleBorder(
    ),

    onPressed: (){
      function();
    },
    child: Text(
      upper ? text.toUpperCase() : text,

      style: TextStyle(
          color: Colors.white,
          fontFamily: 'poppins'
      ),
    ),

  ),
);


Widget defaultTextForm({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? suffixPressed,
  required String? Function(String? val)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool ispassword = false,
}) => TextFormField(
  controller: controller,
  cursorColor: iconscolor,
  keyboardType: type,
  obscureText: ispassword,
  onFieldSubmitted: onSubmit != null? onSubmit() : null,
  onChanged: onChange != null? onChange() : null,
  validator: validate,
  decoration: InputDecoration(
    prefixIconColor: textcolor,
    suffixIconColor: Colors.blueGrey,
    prefixIcon: Icon(
      prefix,
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: textcolor),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: textcolor),
    ),
    suffixIcon: suffix !=null ?
    IconButton(

        onPressed:(){
          suffixPressed!();
        } ,

        icon: Icon(suffix,)) : null,
    labelText: label,
    border: UnderlineInputBorder(

    ),
    labelStyle: TextStyle(
      color: Colors.black,
    ),
  ),
);

Widget defaultTextButton({
  required Function function,
  required String text,
  //MaterialStateProperty<Color?>? color=,

}) =>
    TextButton(
      onPressed: (){
        function();
      },
      child: Text(text,
        style: TextStyle(
            fontFamily: 'poppins'
        ),
      ),
      style:TextButton.styleFrom(foregroundColor: textcolor),
    );

void navigateTo(context,widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context)=> widget,
  ),
);

void navigateAndfFinish(context,widget
    ) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (route)
  {
    return false;
  },
);


void showToast({
  required String text,
  required ToastStates state,
  required color
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: color,
      textColor: chooseToastColor(state),
      fontSize: 16.0,
    );

enum ToastStates {SUCCESS,ERROR,WARNING}

Color chooseToastColor(ToastStates state)
{
  switch(state)
  {
    case ToastStates.SUCCESS:
      return Colors.green;
      break;
    case ToastStates.ERROR:
      return Colors.black;
      break;
    case ToastStates.WARNING:
      return Colors.amber;
      break;
  }
}

PreferredSizeWidget? defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) => AppBar(
  leading: IconButton(
    onPressed: ()
    {
      Navigator.pop(context);
    },
    icon: Icon(
      Icons.align_horizontal_left,
    ),
  ),
  titleSpacing: 5.0,
  title: Text(
    title!,
  ),
  actions: actions,
);

Widget myDivider() => Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.grey[300],
);
bool isEmail(String value) {
  final emailRegex =
  RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(value);
}


Widget disabledbutton({
  //double width = double.infinity,
  Color background = Colors.teal,
  required Function function,
  bool upper = true,
  required String text,
  required double height,
  required double width,
  required double radius,
}) => Container(
  decoration: BoxDecoration(
    color: Color(0xff4E944F),
    borderRadius: BorderRadius.circular(radius),
  ),
  width: width,
  height: height,
  //color: background,
  child: MaterialButton(
    disabledColor: Color(0xff678b68),
    onPressed: ischecked?(){
      function();
    }:null,

    child: Text(
      upper ? text.toUpperCase() : text,

      style: TextStyle(
          color: Colors.white,
          fontFamily: 'poppins'
      ),
    ),

  ),
);