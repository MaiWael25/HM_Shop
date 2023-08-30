//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:itiproject/fire_base_helper/fire_base_sign_up.dart';

import 'login.dart';

//import 'api.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool showPassword =true;
  TextEditingController emailcontroller =TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController nameconteoller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child :Form(
            key: formKey,
            child: Column(
              children: [
                const Text("Register",style: TextStyle(
                    fontSize: 40,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold
                ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: nameconteoller,
                  validator: (value)
                  {

                    if(value!.isEmpty)
                    {
                      return "name must not be empty";
                    }
                    return null;
                  },
                  keyboardType:TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText:"Name",
                    border:OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailcontroller,
                  validator: (value)
                  {
                    final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
                    if(value.isEmpty)
                    {
                      return "Email must not be empty";
                    }
                    else if(emailValid==false)
                    {
                      return "Email format invalid";
                    }
                    return null;
                  },
                  keyboardType:TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText:"Email",
                    border:OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: passwordcontroller,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return "Password must not be empty";
                    }
                    else if(value.length <5) {
                      return "Password is too short";
                    }
                    return null;
                  },
                  obscureText: showPassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration:  InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon:IconButton(
                      onPressed:(){
                        setState(() {
                          showPassword = !showPassword;
                        });
                      }, icon:  Icon(
                        showPassword ? Icons.visibility_off :Icons.visibility),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: phonecontroller,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return "phone must not be empty";
                    }
                    else if(value.length<11)
                    {
                      return "Phone isn't valid";
                    }
                    return null;
                  },
                  keyboardType:TextInputType .phone,
                  decoration: const InputDecoration(
                    labelText:"Phone",
                    border:OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: MaterialButton(
                    onPressed:()async{
                      if(formKey.currentState!.validate())
                      {
                        FirebaseSignUp.signUp(
                            email: emailcontroller.text,
                            name: nameconteoller.text,
                            phone: phonecontroller.text,
                            password: passwordcontroller.text,
                            context: context,
                        );
                        print(emailcontroller.text);

                        print(passwordcontroller.text);
                        // FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text);
                      }
                    } ,
                    child: const Text("Register",style:TextStyle(
                      color:Colors.white,
                    ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Do have an account?"),
                    TextButton(onPressed:()
                    {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
                    }, child:const Text(
                      "login now",
                    ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}