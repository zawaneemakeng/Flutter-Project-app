import 'package:flutter/material.dart';
import 'package:todolist/pages/login.dart';
import 'package:todolist/pages/todolist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
          fontFamily: 'Khanom',
          appBarTheme:
              const AppBarTheme(backgroundColor: const Color(0xff5b3775))),
      debugShowCheckedModeBanner: false,
      title: "Todolist",
    );
  }
}
