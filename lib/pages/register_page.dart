import 'package:flutter/material.dart';
import 'package:socia_media_app/components/button.dart';
import 'package:socia_media_app/components/text_field.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key,  required this. onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

// sign user up
void signUp() async {

  // show loading circle
  showDialog(
    context: context, 
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
  ),
  );

  // make sure passwords match
  if (passwordTextController.text != confirmPasswordTextController.text) {
    //pop loading circle
    Navigator.pop(context);
    //show error to user
    displayMessage("Passwords don't match");
    return;
  }

  //try creating the user
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailTextController, password: passwordTextController);
  } on FirebaseAuthException cath (e) {
    //pop loading circle
    Navigator.pop(context);
    //show error to user
    displayMessage(e.code);
  }
}
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
                Text("Lets create an acount for you!", style: TextStyle(
                      color: Colors.grey[700],
                    ),),
            
                const SizedBox(height: 25),
            
                // email textfiled
                MyTextField(controller: emailTextController, 
                hintText: 'Email', obscureText: false),
                const SizedBox(height: 10),
            
                //inser password
                MyTextField(controller: passwordTextController, hintText: 'Password', obscureText: true),

                const SizedBox(height: 10),
                // confirm pasword
                MyTextField(controller: confirmPasswordTextController, hintText: 'Confirm Password', obscureText: true),

                const SizedBox(height: 25),

                //sing up button
                MyButton(onTap: signUp, text: 'Sing In'),
                const SizedBox(height: 25),


                //go to register page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Al ready have an account?", 
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text("Login now", style: TextStyle(
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