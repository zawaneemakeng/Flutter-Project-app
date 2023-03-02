import 'package:flutter/material.dart';
import 'package:layout/pages/add.dart';
import 'package:layout/pages/cal.dart';
import 'package:layout/pages/home.dart';
import 'package:layout/pages/todolist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainPage(),
      theme: ThemeData(
          fontFamily: 'Khanom',
          appBarTheme:
              const AppBarTheme(backgroundColor: const Color(0xff5b3775))),
      debugShowCheckedModeBanner: false,
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
    Todolist(),
    HomePage(),
    CalculatPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff5b3775),
        selectedItemColor: const Color(0xffdec5f0),
        unselectedItemColor: Color.fromARGB(255, 169, 169, 169),
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'todolist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculate',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
