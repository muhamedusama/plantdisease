import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gp/screens/login/login_screen.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key}
  //
@override
Widget build(BuildContext context)
{
  return MaterialApp(
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
        'login_screen': (context)=> LoginScreen(),
    },
  );
}

}


