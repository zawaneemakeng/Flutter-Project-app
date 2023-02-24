import 'package:flutter/material.dart';
import 'package:layout/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "เเอพเเนะนำพันธุ์เเมว",
      home: HomePage(),
      theme: ThemeData(fontFamily: 'Khanom'),
      debugShowCheckedModeBanner: false,
    );
  }
}
