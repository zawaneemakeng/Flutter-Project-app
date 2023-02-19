import 'package:catcalculate/pages/calc.dart';
import 'package:catcalculate/pages/contact.dart';
import 'package:catcalculate/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Khanom'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  static const List<Widget> tabs = <Widget>[
    HomaPage(),
    CalculatPage(),
    ContactPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "เเอพคำนวณปริมาณอาหารที่เเมวควรทาน",
        ),
        backgroundColor: const Color(0xff5b3775),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffdec5f0),
        selectedItemColor: const Color(0xff5b3775),
        unselectedItemColor: const Color.fromARGB(255, 96, 95, 95),
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'Contact',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
