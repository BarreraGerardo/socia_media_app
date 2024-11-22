import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePagesState();
  }

class _HomePagesState extends State<HomePage> {

  // sign user out
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("The Wall"),
      actions: [
        // sign out button
        IconButton(
          onPressed: signOut,
          icon: Icon(Icons.logout),
          )
      ]
      ),
    );
  }
  }
