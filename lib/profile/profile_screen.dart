import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:itiproject/auth/login.dart';
import 'package:itiproject/profile/about%20_app_screen.dart';
import 'package:itiproject/profile/about_developers_screen.dart';
import 'package:itiproject/profile/custom_profile_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _HomeScreen();
}
class _HomeScreen extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title:Text(
          " profile",
          style: TextStyle(
            color: Colors.brown,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
               FutureBuilder<DocumentSnapshot<Map<String,dynamic>>>(
                 future:FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get(),
                 builder: (context, snapshot) {
                   return  Row(
                     children: [
                       CircleAvatar(radius: 40,),
                       SizedBox(width: 10,),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             snapshot.data?["name"]??"Mai",
                             style: TextStyle(
                               color: Colors.black,
                               fontSize: 20,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                           Text(
                   snapshot.data?["email"]??"Mai",
                             style: TextStyle(
                               color: Colors.grey,
                               fontSize: 16,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ],
                       )
                     ],
                   );
                 },
               ),
              SizedBox(
                height: 50,
              ),
              ListTileWidget(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AboutDevlopersScreen(),)
                    );
                  },
                  title: "About Developers",
              ),
              SizedBox(
                height: 20,
              ),
              ListTileWidget(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AboutAppScreen(),)
                  );
                },
                title: "About App",
              ),
              SizedBox(
                height: 20,
              ),
              ListTileWidget(
                onTap: ()async {
                await  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Login(),)
                    );
                  })
;
                },
                title: "Logout",
              ),
            ],
          ),
        ),
      ),
    );
  }
}