import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/pages/login.dart';
import 'package:todolist/pages/todolist.dart';

var token; //สำหรับเก็บโทเค้นของยูเซอร์

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //รับเเอบเเบบเบื้องหลัง
  SharedPreferences pref = await SharedPreferences.getInstance();
  token = pref.getString('token');
  print(token);
  runApp(MaterialApp(
    home: token == null ? MyApp() : Todolist(),
    theme: ThemeData(
        fontFamily: 'Khanom',
        appBarTheme:
            const AppBarTheme(backgroundColor: const Color(0xff5b3775))),
    debugShowCheckedModeBanner: false,
  ));
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
