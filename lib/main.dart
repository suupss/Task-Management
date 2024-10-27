import 'package:flutter/material.dart';
import 'package:task_mgmt/screens/first_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task_mgmt/firebase_options.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );


  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 122, 18, 141),
      primary: Colors.indigo[200],
      secondary:const Color.fromARGB(255, 218, 221, 240)
     ),
      textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    titleMedium: TextStyle(fontSize: 16, ),
    bodySmall: TextStyle(color: Colors.indigo,fontSize: 15),
      ),
      appBarTheme: AppBarTheme(
    color: Colors.indigo[200],
    toolbarHeight: 60,
    foregroundColor: Colors.white, 
      ),
    ),
    home: const FirstScreen(),
    );
  }
}