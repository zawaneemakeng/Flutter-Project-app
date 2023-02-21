import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("details"),
        backgroundColor: const Color.fromARGB(255, 16, 121, 85),
      ),
      body: ListView(
        children: const [Text("Detail for Article")],
      ),
    );
  }
}
