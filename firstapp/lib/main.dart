import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'My Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/catread.png',
                height: 100,
                width: 100,
              ),
              const Text(
                "Hi, There! How are you?\n I'm find ^^",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color.fromARGB(255, 106, 55, 158),
                    fontFamily: 'Khanom'),
              ),
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/7603/7603474.png',
                height: 100,
                width: 100,
              )
            ],
          ),
        ));
  }
}
