import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:itiproject/BNB_screen.dart';
import 'package:itiproject/auth/login.dart';


//import 'package:flutter_on_boarding/introduction_screen.dart';
import 'package:itiproject/category/categories_screen.dart';

import 'package:itiproject/auth/introduction.dart';
import 'package:itiproject/profile/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


bool show = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(const MyApp());

}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter On Boarding',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     home:
     Intro()
     // show ? Intro() : FirebaseAuth.instance.currentUser?.uid == null ?  Login():BNBScreen(),
    );
  }
}
