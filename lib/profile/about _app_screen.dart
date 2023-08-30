import 'package:flutter/material.dart';


class AboutAppScreen extends StatefulWidget {
  AboutAppScreen({super.key});

  @override
  State<AboutAppScreen> createState() => _HomeScreen();
}
class _HomeScreen extends State<AboutAppScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange,),
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),

        child: Form(
          child: Column(
            children: [

              const Text(
                "About App",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Welcome, we hope you enjoy and find what you want ",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "-our application offers clothes, shoes and bags with the best quality and price  ",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "- We offer products that suit all people and tastes ",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "-You can move between pages and sections easily ",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "-you should log in to see our products and offers!!",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}