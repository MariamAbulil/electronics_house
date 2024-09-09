import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mariana/auth/login.dart';
import 'package:mariana/auth/signup.dart';
import 'package:mariana/pages/checkout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mariana/pages/smartwatch.dart';
import 'package:mariana/pages/start.dart';
import 'package:mariana/pages/watchdetails.dart';
import 'package:mariana/pages/details.dart';
import 'package:mariana/pages/home.dart';
import 'package:mariana/provider/cart.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';
import 'pages/about.dart';
import 'package:mariana/provider/cart.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(MyApp());
}

class FirebaseAuth {
  static var instance;

  authStateChanges() {}
}

class Firebase {
  static initializeApp() {}
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {return Cart();},
      child: MaterialApp(home:  Start() ,
        routes: <String, WidgetBuilder>{
          "signup": (context) => Signup(),
          "login": (context) => Login(),
          "about": (context) => about(),
          "checkout": (context) => CheckOut(),
          "home": (context) => Home(),
          "smartwatch": (context) => smartwatch(),
        },
        debugShowCheckedModeBanner: false,
      ),);
  }
}










