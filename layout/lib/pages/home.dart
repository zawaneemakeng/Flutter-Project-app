import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เเอพเเนะนำพันธุ์เเมว"),
        backgroundColor: const Color.fromARGB(255, 16, 121, 85),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          MyBox(),
          const SizedBox(
            height: 30,
          ),
          MyBox(),
          const SizedBox(
            height: 30,
          ),
          MyBox()
        ]),
      ),
    );
  }

  Widget MyBox() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color.fromARGB(255, 152, 205, 186),
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'บริติช ช็อตแฮร์ (British Shorthair)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            ' British shorthair เป็นหนึ่งในสายพันธุ์แมวที่เก่าแก่ที่สุดของประเทศอังกฤษ',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
