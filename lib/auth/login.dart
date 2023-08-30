import 'package:flutter/material.dart';
import 'package:itiproject/auth/register.dart';
import 'package:itiproject/fire_base_helper/fire_base_login.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange,),
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),

        child: Form(
          key:formKey,
          child: Column(
            children: [
              // Image(image: AssetImage('images/login.png'),),
              //child: Center(child: FlutterLogo(size: 300)),
              const Text(
                "Login",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),

              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                validator: (value){
                  if(value!.isEmpty){
                    return "Email must not be empty";
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: passwordController,
                validator: (value){
                  if(value!.isEmpty){
                    return "Password must not be empty";
                  }
                  return null;
                },
                obscureText: showPassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        showPassword=!showPassword;
                      });
                    },
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                  border: OutlineInputBorder(),

                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: MaterialButton(
                  onPressed: (){
                    if(formKey.currentState!.validate()){
                      FirebaseSignIn.signIn(
                          email: emailController.text,
                          password: passwordController.text,
                          context: context,
                      );
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.brown,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?",
                    style: TextStyle(color: Colors.brown),),

                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register(),));
                  }, child: Text(
                      "Register now",
                      style :TextStyle(color:Colors.orange)),


                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}