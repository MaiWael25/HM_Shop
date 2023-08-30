import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itiproject/BNB_screen.dart';
import 'package:itiproject/category/categories_screen.dart';

class FirebaseSignUp {
  static Future<void> signUp({required String email,required String name,required String phone,required String password , required BuildContext context})async{
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value){
      Fluttertoast.showToast(
        msg: "Sign Up Successfully",
        gravity: ToastGravity.CENTER_RIGHT,
        timeInSecForIosWeb:5,
      ).then((value) async{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BNBScreen(),));
        await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).set(
            {
              "name":name,
              "password":password,
              "email":email,
              "phone":phone,
              "image":null,
            }
        );
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