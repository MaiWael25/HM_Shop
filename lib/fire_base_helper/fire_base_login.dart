import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itiproject/BNB_screen.dart';

import '../category/categories_screen.dart';

class FirebaseSignIn {
  static Future<void> signIn({required String email,required String password , required BuildContext context})async{
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value){
      Fluttertoast.showToast(
        msg: "Sign in Successfully",
        gravity: ToastGravity.CENTER_RIGHT,
        timeInSecForIosWeb: 2,
      ).then((value) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BNBScreen(),));
      });
    }).catchError((error){
      Fluttertoast.showToast(
        msg: error.toString(),
        gravity: ToastGravity.CENTER_RIGHT,
        timeInSecForIosWeb: 5,
      );
    });
  }
}