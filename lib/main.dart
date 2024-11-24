import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socia_media_app/components/firebase_options.dart';
import 'package:socia_media_app/pages/home_page.dart';
import 'package:socia_media_app/theme/light_theme.dart';
import 'package:socia_media_app/theme/dark_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp ({super.key});
@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: lightTheme,
    darkTheme: darkTheme,
    home: const HomePage(),
  );
 }
}