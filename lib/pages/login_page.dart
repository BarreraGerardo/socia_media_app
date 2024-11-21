import 'package:flutter/material.dart';
import 'package:socia_media_app/components/button.dart';
import 'package:socia_media_app/components/text_field.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //edicion del texto 
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                const Icon(Icons.lock, size: 100,),
            
                const SizedBox(height: 50,),
            
                //welcome back message
                Text("Welcome back, long time we don't see you", style: TextStyle(
                      color: Colors.grey[700],
                    ),),
            
                const SizedBox(height: 25),
            
                // email textfiled
                MyTextField(controller: emailTextController, 
                hintText: 'Email', obscureText: false),
                const SizedBox(height: 25),
            
                //inser password
                MyTextField(controller: passwordTextController, hintText: 'Password', obscureText: true),

                const SizedBox(height: 10),

                //sing in button
                MyButton(onTap: (){}, text: 'Sing In'),
                const SizedBox(height: 25),


                //go to register page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member?", 
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: (){},
                      child: const Text("Register now!", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),),
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