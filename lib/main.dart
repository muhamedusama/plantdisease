import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/screens/login/login_screen.dart';
import 'package:gp/screens/model/cubit/cubit.dart';
import 'package:gp/screens/welcome_screen/welcome_screen.dart';
import 'package:gp/shared/components.dart';
import 'package:gp/shared/network/network.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key}
  //
@override
Widget build(BuildContext context)
{


  return MultiBlocProvider(
      providers: [
      BlocProvider(create: (BuildContext context) => modelcubit()..getUserData()),
],
child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.teal,
        )
      ),
      home: Scaffold(
        backgroundColor: Colors.teal,
      ),
    initialRoute: 'login_screen' ,
    routes: {
        'login_screen': (context)=> WelcomeScreen(),
    },
  ),
  );

}

}


