import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:valorant_rehber/pages/page_home.dart';
import 'package:valorant_rehber/pages/page_test.dart';
import '../assets/textfiles/textfile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TitleClass.title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
