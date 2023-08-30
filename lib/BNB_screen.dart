import 'package:flutter/material.dart';
import 'package:itiproject/category/categories_screen.dart';
import 'package:itiproject/profile/profile_screen.dart';

class BNBScreen extends StatefulWidget {
  const BNBScreen({super.key});

  @override
  State<BNBScreen> createState() => _BNBScreenState();
}

class _BNBScreenState extends State<BNBScreen> {
  int current = 0;
  List<Widget> screens=[
    CategoriesScreen(),
    CategoriesScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current,
        selectedItemColor: Colors.orange,
        onTap: (value) {
          setState(() {
            current = value;
          });
        },
        items: [
         BottomNavigationBarItem(
             icon:Icon(
               Icons.home,
             ) ,
           label: "Home"
         ),
    BottomNavigationBarItem(
        icon:Icon(
          Icons.category_rounded,
        ) ,
        label: "Categories"
    ),
          BottomNavigationBarItem(
              icon:Icon(
                Icons.person,
              ) ,
              label: "Profile"
          ),
        ],
      ),
      body: screens[current],
    );
  }
}
