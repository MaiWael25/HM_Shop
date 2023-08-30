//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
//import 'package:flutter_on_boarding/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';
import 'onbording_page_state.dart';
class Intro extends StatelessWidget {
  Intro({super.key});
  final  List<PageViewModel> pages = [
    PageViewModel(
      title: 'Welcome to our App',
      body: 'hello from the future our user we hope '
          'you enjoy your journey in our app',

      footer: ElevatedButton(
        onPressed: (){},
        style:  ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.orange),
        ),


        child: const Text("let's Goo",
        style: TextStyle(color: Colors.brown),
        ),


      ),

        image: Center(
          child: Image.asset('assets/7.png'),
        ),
      decoration:  const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w900,
          color: Colors.brown,

        ),
        bodyTextStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.brown,
        ),

      ),


    ),


    PageViewModel(
        title: 'We provide the best'
            '      wholesale offers ',
        body: 'You will find the amazing sales '
            'for all our products this is your destination for savings',
        footer: ElevatedButton(
          onPressed: (){

          },
          style:  ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.orange),
          ),


          child: const Text("let's Goo",
            style: TextStyle(color: Colors.brown),
          ),


        ),

        image: Center(
          child: Image.asset('assets/8.png'),
        ),
      decoration:  const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w900,
          color: Colors.brown,

        ),
        bodyTextStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.brown,
        ),

      ),
    ),
    PageViewModel(
        title: 'Keep Going to see more and more',
        body: 'If you Register you will get more features '
            ' we wish you a pleasant and useful trip :) ',
        footer: ElevatedButton(
          onPressed: (){},
          style:  ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.orange),
          ),


          child: const Text("let's Goo",
            style: TextStyle(color: Colors.brown),
          ),
        ),
       image: Center(
         child: Image.asset('assets/10.png'),
       ),
      decoration:  const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w900,
          color: Colors.brown,

        ),
        bodyTextStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.brown,
        ),

      ),
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: Colors.white,
        title: const Text("HM Shop"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.brown,
        ),


      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size (15,15),
            color: Colors.orange,
            activeSize: Size.square(20),
            activeColor: Colors.brown,
          ),
          showDoneButton: true,
          done: const Text("Done",style: TextStyle(fontSize: 20),),
          showSkipButton: true,
          color: Colors.orange,
          skip: const Text("Skip",style: TextStyle(fontSize: 20),),
          showNextButton: true,
          next: const Icon(Icons.arrow_forward,size: 25,),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,

        ),
      ),
    );
  }
  Future<void> onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON BORDING',false);

    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)  =>  Login()));
  }
}
