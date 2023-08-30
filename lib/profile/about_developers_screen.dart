import 'package:flutter/material.dart';


class AboutDevlopersScreen extends StatefulWidget {
  const AboutDevlopersScreen({super.key});

  @override
  State<AboutDevlopersScreen> createState() => _Home();
}
class _Home extends State<AboutDevlopersScreen> {

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
                "Team names",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 95,
              ),
              const Text(
                "Mai Wael Hamed Mahmoud",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Hana Hatem Mohammedd ",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 25,
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